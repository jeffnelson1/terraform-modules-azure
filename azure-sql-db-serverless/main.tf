provider "azurerm" {
  features {}
}

resource "azurerm_mssql_database" "sql_db" {
  name                        = var.sql_database_name
  server_id                   = var.sql_server_id
  collation                   = "SQL_Latin1_General_CP1_CI_AS"
  auto_pause_delay_in_minutes = var.auto_pause_delay_in_minutes
  max_size_gb                 = var.max_size_gb
  sku_name                    = var.sku_name
  zone_redundant              = var.zone_redundant
  tags                        = var.tags
  min_capacity                = var.min_core_capacity
}