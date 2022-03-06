output "rg_name" {
  value       = azurerm_resource_group.rg.name
  description = "Resource Group Name"
}

output "region" {
  value       = azurerm_resource_group.rg.location
  description = "Region Name"
}
