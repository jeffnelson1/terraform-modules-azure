provider "azurerm" {
  features {}
}

resource "azurerm_mssql_server" "sql_server" {
  name                          = var.sql_server_name
  resource_group_name           = var.sql_server_rg_name
  location                      = var.location
  version                       = var.sql_version
  administrator_login           = var.sql_admin_name
  administrator_login_password  = var.sql_admin_password
  public_network_access_enabled = var.enable_public_access
  tags                          = var.tags
  minimum_tls_version           = "1.2"
}

resource "azurerm_management_lock" "sql_server_lock" {
  name       = "delete-lock-sql-server"
  scope      = azurerm_mssql_server.sql_server.id
  lock_level = "CanNotDelete"
  notes      = "Delete lock on SQL Server."
}