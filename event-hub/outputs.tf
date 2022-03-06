output "event_hub_ns_resource_id" {
  value       = azurerm_eventhub_namespace.eh_namespace.id
  description = "The resource ID of the event hub namespace."
}