provider "azurerm" {
  features {}
}

resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.workspace_rg_name
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_in_days
  tags                = var.tags

}

resource "azurerm_management_lock" "log_workspace_lock" {
  count      = var.enable_resource_lock ? 1 : 0
  name       = "delete-lock-log_workspace"
  scope      = azurerm_log_analytics_workspace.log_workspace.id
  lock_level = "CanNotDelete"
  notes      = "Delete lock on log analytics workspace."
}