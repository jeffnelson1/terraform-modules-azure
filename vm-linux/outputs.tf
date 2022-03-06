output "vm_resource_id" {
  value       = azurerm_linux_virtual_machine.main.*.id
  description = "The resource ID of the VM."
}

output "subnet_id" {
  value       = data.azurerm_subnet.main.id
  description = "The resource ID of the subnet."
}
