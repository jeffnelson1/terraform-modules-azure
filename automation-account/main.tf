provider "azurerm" {
  features {}
}

resource "azurerm_automation_account" "automation_account" {
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = var.rg_name
  sku_name            = "Basic"
  tags                = var.tags
}

resource "azurerm_management_lock" "automation_account_lock" {
  count      = var.enable_resource_lock ? 1 : 0
  name       = "delete-lock-automation-account"
  scope      = azurerm_automation_account.automation_account.id
  lock_level = "CanNotDelete"
  notes      = "Delete lock on automation account."
}

