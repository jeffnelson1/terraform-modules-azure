provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "storage_account" {
  name                      = var.storage_account_name
  resource_group_name       = var.rg_name
  location                  = var.location
  account_tier              = var.account_tier
  account_replication_type  = var.replication_type
  account_kind              = var.account_kind
  access_tier               = var.access_tier
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  tags                      = var.tags

  network_rules {
    default_action = "Allow"
  }
}

resource "azurerm_management_lock" "storage_account_lock" {
  count      = var.enable_resource_lock ? 1 : 0
  name       = "delete-lock-storage-account"
  scope      = azurerm_storage_account.storage_account.id
  lock_level = "CanNotDelete"
  notes      = "Delete lock on storage account."
}

