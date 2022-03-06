provider "azurerm" {
  features {}
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = var.rsv_name
  location            = var.secondary_location
  resource_group_name = var.rsv_rg_name
  sku                 = "Standard"
  tags                = var.tags

  soft_delete_enabled = true
}

resource "azurerm_management_lock" "rsv_lock" {
  count      = var.enable_resource_lock ? 1 : 0
  name       = "delete-lock-rsv"
  scope      = azurerm_recovery_services_vault.vault.id
  lock_level = "CanNotDelete"
  notes      = "Delete lock on recovery services vault."
}

resource "azurerm_site_recovery_fabric" "primary" {
  name                = "primary-fabric"
  resource_group_name = var.rsv_rg_name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  location            = var.primary_location
}

resource "azurerm_site_recovery_fabric" "secondary" {
  name                = "secondary-fabric"
  resource_group_name = var.rsv_rg_name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  location            = var.secondary_location
}

resource "azurerm_site_recovery_protection_container" "primary" {
  name                 = "primary-protection-container"
  resource_group_name  = var.rsv_rg_name
  recovery_vault_name  = azurerm_recovery_services_vault.vault.name
  recovery_fabric_name = azurerm_site_recovery_fabric.primary.name
}

resource "azurerm_site_recovery_protection_container" "secondary" {
  name                 = "secondary-protection-container"
  resource_group_name  = var.rsv_rg_name
  recovery_vault_name  = azurerm_recovery_services_vault.vault.name
  recovery_fabric_name = azurerm_site_recovery_fabric.secondary.name
}

resource "azurerm_site_recovery_replication_policy" "oneHourPolicy" {
  name                                                 = "RPO-01"
  resource_group_name                                  = var.rsv_rg_name
  recovery_vault_name                                  = azurerm_recovery_services_vault.vault.name
  recovery_point_retention_in_minutes                  = 24 * 60
  application_consistent_snapshot_frequency_in_minutes = 1 * 60
}

resource "azurerm_site_recovery_replication_policy" "twoHourPolicy" {
  name                                                 = "RPO-02"
  resource_group_name                                  = var.rsv_rg_name
  recovery_vault_name                                  = azurerm_recovery_services_vault.vault.name
  recovery_point_retention_in_minutes                  = 24 * 60
  application_consistent_snapshot_frequency_in_minutes = 2 * 60
}

resource "azurerm_site_recovery_replication_policy" "fourHourPolicy" {
  name                                                 = "RPO-04"
  resource_group_name                                  = var.rsv_rg_name
  recovery_vault_name                                  = azurerm_recovery_services_vault.vault.name
  recovery_point_retention_in_minutes                  = 24 * 60
  application_consistent_snapshot_frequency_in_minutes = 4 * 60
}

resource "azurerm_site_recovery_replication_policy" "twelveHourPolicy" {
  name                                                 = "RPO-12"
  resource_group_name                                  = var.rsv_rg_name
  recovery_vault_name                                  = azurerm_recovery_services_vault.vault.name
  recovery_point_retention_in_minutes                  = 24 * 60
  application_consistent_snapshot_frequency_in_minutes = 12 * 60
}

resource "azurerm_site_recovery_protection_container_mapping" "pri-to-sec-container-mapping" {
  name                                      = "primary-to-secondary-mapping"
  resource_group_name                       = var.rsv_rg_name
  recovery_vault_name                       = azurerm_recovery_services_vault.vault.name
  recovery_fabric_name                      = azurerm_site_recovery_fabric.primary.name
  recovery_source_protection_container_name = azurerm_site_recovery_protection_container.primary.name
  recovery_target_protection_container_id   = azurerm_site_recovery_protection_container.secondary.id
  recovery_replication_policy_id            = azurerm_site_recovery_replication_policy.fourHourPolicy.id
}

resource "azurerm_site_recovery_protection_container_mapping" "sec-to-pri-container-mapping" {
  name                                      = "secondary-to-primary-mapping"
  resource_group_name                       = var.rsv_rg_name
  recovery_vault_name                       = azurerm_recovery_services_vault.vault.name
  recovery_fabric_name                      = azurerm_site_recovery_fabric.secondary.name
  recovery_source_protection_container_name = azurerm_site_recovery_protection_container.secondary.name
  recovery_target_protection_container_id   = azurerm_site_recovery_protection_container.primary.id
  recovery_replication_policy_id            = azurerm_site_recovery_replication_policy.fourHourPolicy.id
}

data "azurerm_virtual_network" "primary" {
  name                = lookup(var.vnet_name, var.environment_primary_region)
  resource_group_name = lookup(var.vnet_rg_name, var.environment_primary_region)
}

data "azurerm_virtual_network" "secondary" {
  name                = lookup(var.vnet_name, var.environment_secondary_region)
  resource_group_name = lookup(var.vnet_rg_name, var.environment_secondary_region)
}

resource "azurerm_site_recovery_network_mapping" "recovery-mapping-pri-to-sec" {
  name                        = "pri-to-sec-net-mapping"
  resource_group_name         = var.rsv_rg_name
  recovery_vault_name         = azurerm_recovery_services_vault.vault.name
  source_recovery_fabric_name = azurerm_site_recovery_fabric.primary.name
  target_recovery_fabric_name = azurerm_site_recovery_fabric.secondary.name
  source_network_id           = data.azurerm_virtual_network.primary.id
  target_network_id           = data.azurerm_virtual_network.secondary.id
}

resource "azurerm_site_recovery_network_mapping" "recovery-mapping-sec-to-pri" {
  name                        = "sec-to-pri-net-mapping"
  resource_group_name         = var.rsv_rg_name
  recovery_vault_name         = azurerm_recovery_services_vault.vault.name
  source_recovery_fabric_name = azurerm_site_recovery_fabric.secondary.name
  target_recovery_fabric_name = azurerm_site_recovery_fabric.primary.name
  source_network_id           = data.azurerm_virtual_network.secondary.id
  target_network_id           = data.azurerm_virtual_network.primary.id
}