provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  name                            = var.kv_name
  location                        = var.location
  resource_group_name             = var.kv_rg_name
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days      = 7
  purge_protection_enabled        = true
  tags                            = var.tags

  sku_name = "standard"

  network_acls {

    bypass                     = "AzureServices"
    default_action             = var.network_acl_default_action
    virtual_network_subnet_ids = var.allowed_subnet_ids
  }

}

resource "azurerm_key_vault_access_policy" "assignment_1" {
  count              = var.enable_access_assignment_1 ? 1 : 0
  key_vault_id       = azurerm_key_vault.keyvault.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = var.object_id_1
  key_permissions    = var.key_permissions_1
  secret_permissions = var.secret_permissions_1
}

resource "azurerm_key_vault_access_policy" "assignment_2" {
  count              = var.enable_access_assignment_2 ? 1 : 0
  key_vault_id       = azurerm_key_vault.keyvault.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = var.object_id_2
  key_permissions    = var.key_permissions_2
  secret_permissions = var.secret_permissions_2
}

resource "azurerm_key_vault_access_policy" "assignment_3" {
  count              = var.enable_access_assignment_3 ? 1 : 0
  key_vault_id       = azurerm_key_vault.keyvault.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = var.object_id_3
  key_permissions    = var.key_permissions_3
  secret_permissions = var.secret_permissions_3
}

resource "azurerm_management_lock" "kv_lock" {
  count      = var.enable_resource_lock ? 1 : 0
  name       = "delete-lock-rsv"
  scope      = azurerm_key_vault.keyvault.id
  lock_level = "CanNotDelete"
  notes      = "Delete lock on key vault."
}

data "azurerm_key_vault" "main" {
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
  depends_on          = [azurerm_key_vault.keyvault]
}

resource "azurerm_monitor_diagnostic_setting" "diag_logs" {
  name                           = "diag-logs"
  target_resource_id             = azurerm_key_vault.keyvault.id
  eventhub_authorization_rule_id = lookup(var.eventhub_rule_id, var.location)
  eventhub_name                  = lookup(var.eventhub_name, var.location)

  log {
    category = "AuditEvent"
    enabled  = true
  }
  log {
    category = "AzurePolicyEvaluationDetails"
    enabled  = true
  }
}

resource "azurerm_private_endpoint" "endpoint" {
  name                = "pe-${var.kv_name}"
  location            = var.location
  resource_group_name = var.kv_rg_name
  subnet_id           = var.private_endpoint_subnet_id

  private_service_connection {
    name                           = "plc-${var.kv_name}"
    private_connection_resource_id = azurerm_key_vault.keyvault.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }

  private_dns_zone_group {
    name                 = "privatelink.vaultcore.azure.net"
    private_dns_zone_ids = ["/subscriptions/00/*/privateDnsZones/privatelink.vaultcore.azure.net"]
  }
}