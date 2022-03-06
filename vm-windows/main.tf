provider "azurerm" {
  features {}
}

data "azurerm_subnet" "main" {
  name                 = var.subnet_name
  virtual_network_name = lookup(var.vnet_name, var.environment)
  resource_group_name  = lookup(var.vnet_rg_name, var.environment)
}

resource "azurerm_network_interface" "main" {
  name                = "nic-${var.vm_names[count.index]}"
  count               = length(var.vm_names)
  location            = var.location
  resource_group_name = var.vm_rg_name
  tags                = var.tags

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_managed_disk" "data_disk" {
  name                 = "datadisk0-${var.vm_names[count.index]}"
  count                = length(var.vm_names)
  zones                = var.disk_zone[count.index]
  location             = var.location
  resource_group_name  = var.data_disk_rg_name
  storage_account_type = var.data_disk_type
  create_option        = "Empty"
  disk_size_gb         = var.data_disk_size_gb
  tags                 = var.tags
  lifecycle {
    ignore_changes = [encryption_settings]
  }
}

resource "azurerm_managed_disk" "data_disk_2" {
  name                 = "datadisk1-${var.vm_names[count.index]}"
  count                = var.create_data_disk_2 ? length(var.vm_names) : 0
  zones                = var.disk_zone[count.index]
  location             = var.location
  resource_group_name  = var.data_disk_rg_name
  storage_account_type = var.data_disk_2_disk_type
  create_option        = "Empty"
  disk_size_gb         = var.data_disk_2_size_gb
  tags                 = var.tags
  lifecycle {
    ignore_changes = [encryption_settings]
  }
}

resource "azurerm_managed_disk" "data_disk_3" {
  name                 = "datadisk2-${var.vm_names[count.index]}"
  count                = var.create_data_disk_3 ? length(var.vm_names) : 0
  zones                = var.disk_zone[count.index]
  location             = var.location
  resource_group_name  = var.data_disk_rg_name
  storage_account_type = var.data_disk_3_disk_type
  create_option        = "Empty"
  disk_size_gb         = var.data_disk_3_size_gb
  tags                 = var.tags
  lifecycle {
    ignore_changes = [encryption_settings]
  }
}

resource "azurerm_windows_virtual_machine" "main" {
  name                  = var.vm_names[count.index]
  count                 = length(var.vm_names)
  location              = var.location
  resource_group_name   = var.vm_rg_name
  network_interface_ids = [element(azurerm_network_interface.main.*.id, count.index)]
  zone                  = var.vm_zone[count.index]
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password

  os_disk {
    name                 = "osdisk-${var.vm_names[count.index]}"
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_type
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.windows_os_version
    version   = "latest"
  }
  boot_diagnostics {
    storage_account_uri = lookup(var.storage_account_uri, var.environment)
  }
  tags = merge(tomap({ "Patch_Group" = format("%s", var.patch_group[count.index]) }), var.tags)
  lifecycle {
    ignore_changes = [identity]
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "main" {
  count              = length(var.vm_names)
  managed_disk_id    = element(azurerm_managed_disk.data_disk.*.id, count.index)
  virtual_machine_id = element(azurerm_windows_virtual_machine.main.*.id, count.index)
  lun                = "0"
  caching            = "None"
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_2" {
  count              = var.create_data_disk_2 ? length(var.vm_names) : 0
  managed_disk_id    = element(azurerm_managed_disk.data_disk_2.*.id, count.index)
  virtual_machine_id = element(azurerm_windows_virtual_machine.main.*.id, count.index)
  lun                = "1"
  caching            = "None"
  depends_on         = [azurerm_virtual_machine_data_disk_attachment.main]
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_3" {
  count              = var.create_data_disk_3 ? length(var.vm_names) : 0
  managed_disk_id    = element(azurerm_managed_disk.data_disk_3.*.id, count.index)
  virtual_machine_id = element(azurerm_windows_virtual_machine.main.*.id, count.index)
  lun                = "2"
  caching            = "None"
  depends_on         = [azurerm_virtual_machine_data_disk_attachment.data_disk_2]
}

resource "azurerm_backup_protected_vm" "vm1" {
  count               = length(var.vm_names)
  resource_group_name = lookup(var.backup_rsv_rg_name, var.environment)
  recovery_vault_name = lookup(var.backup_rsv_name, var.environment)
  source_vm_id        = element(azurerm_windows_virtual_machine.main.*.id, count.index)
  backup_policy_id    = lookup(var.backup_policy_id, var.environment)
}

resource "azurerm_management_lock" "virtual_machine_lock" {
  count      = var.enable_resource_lock ? length(var.vm_names) : 0
  name       = "delete-lock-virtual-machine"
  scope      = element(azurerm_windows_virtual_machine.main.*.id, count.index)
  lock_level = "CanNotDelete"
  notes      = "Delete lock on virtual machine."
}

resource "azurerm_virtual_machine_extension" "domain_join" {
  name                 = "domain_join-${var.vm_names[count.index]}"
  count                = length(var.vm_names)
  virtual_machine_id   = element(azurerm_windows_virtual_machine.main.*.id, count.index)
  publisher            = "Microsoft.Compute"
  type                 = "JsonADDomainExtension"
  type_handler_version = "1.3"
  settings             = <<SETTINGS
{
      "Name":    "${lookup(var.domain_name, var.environment)}",
      "OUPath":  "${lookup(var.ou_target, var.environment)}",
      "User":    "${lookup(var.domain_name, var.environment)}\\${var.domain_join_userid}",
      "Restart": "true",
      "Options": "3"
}
SETTINGS
  protected_settings   = <<PROTECTED_SETTINGS
{    
    "Password": "${var.domain_join_pass}"
}
PROTECTED_SETTINGS

}

resource "azurerm_virtual_machine_extension" "Datadog" {
  name                 = "DatadogAgent"
  count                = length(var.vm_names)
  virtual_machine_id   = element(azurerm_windows_virtual_machine.main.*.id, count.index)
  publisher            = "Datadog.Agent"
  type                 = "DatadogWindowsAgent"
  type_handler_version = "1.1"
  depends_on = [azurerm_virtual_machine_data_disk_attachment.main,
    azurerm_backup_protected_vm.vm1,
    azurerm_virtual_machine_extension.domain_join
  ]

  settings = <<SETTINGS
    {
        
    }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
      {
          "api_key": "${var.datadog_api}"
          }
  PROTECTED_SETTINGS

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "custom_script" {
  name                 = "CustomScriptExtension"
  count                = length(var.vm_names)
  virtual_machine_id   = element(azurerm_windows_virtual_machine.main.*.id, count.index)
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"
  depends_on = [azurerm_virtual_machine_data_disk_attachment.main,
    azurerm_virtual_machine_extension.Datadog
  ]

  settings = <<SETTINGS
    {
        "fileUris": [
          "https://saaccount.blob.core.windows.net/installs.ps1",
          "https://saaccount.blob.core.windows.net/installs.zip"
        ]
    }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
            "commandToExecute": "powershell.exe ./deploy.ps1",
            "storageAccountName": "saaccount",
            "storageAccountKey": "${var.sa_key}"
    }
  PROTECTED_SETTINGS

  tags = var.tags
}

resource "azurerm_key_vault_key" "kek" {
  name         = "${var.vm_names[count.index]}-key"
  count        = length(var.vm_names)
  key_vault_id = var.vault_id
  key_type     = "RSA"
  key_size     = 2048
  depends_on = [
    azurerm_virtual_machine_data_disk_attachment.main,
    azurerm_virtual_machine_extension.Datadog
  ]

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}

resource "azurerm_key_vault_key" "kek_secondary" {
  name         = "${var.vm_names[count.index]}-key"
  count        = var.enable_azure_site_recovery ? length(var.vm_names) : 0
  key_vault_id = var.vault_id_secondary
  key_type     = "RSA"
  key_size     = 2048
  depends_on = [
    azurerm_virtual_machine_data_disk_attachment.main,
    azurerm_virtual_machine_extension.Datadog
  ]

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}

