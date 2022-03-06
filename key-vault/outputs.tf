output "keyvault_resource_id" {
  value       = azurerm_key_vault.keyvault.id
  description = "The resource ID of the Key Vault."
}

output "vault_uri" {
  value       = data.azurerm_key_vault.main.vault_uri
  description = "URI of the Key Vault."
}