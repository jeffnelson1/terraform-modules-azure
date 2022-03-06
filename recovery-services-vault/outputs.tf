output "rsv_resource_id" {
  value       = azurerm_recovery_services_vault.vault.id
  description = "The resource ID of the Recovery Services vault."
}