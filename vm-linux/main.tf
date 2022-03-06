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

resource "azurerm_linux_virtual_machine" "main" {
  name                  = var.vm_names[count.index]
  count                 = length(var.vm_names)
  location              = var.location
  resource_group_name   = var.vm_rg_name
  network_interface_ids = [element(azurerm_network_interface.main.*.id, count.index)]
  zone                  = var.vm_zone[count.index]
  size                  = var.vm_size
  admin_username        = var.admin_username

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }

  os_disk {
    name                 = "osdisk-${var.vm_names[count.index]}"
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_type
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  boot_diagnostics {
    storage_account_uri = lookup(var.storage_account_uri, var.environment)
  }

  tags = merge(tomap({ "Patch_Group" = format("%s", var.patch_group[count.index]) }), var.tags)

  lifecycle {
    ignore_changes = [identity]
  }
}

resource "azurerm_backup_protected_vm" "vm1" {
  count               = length(var.vm_names)
  resource_group_name = lookup(var.backup_rsv_rg_name, var.environment)
  recovery_vault_name = lookup(var.backup_rsv_name, var.environment)
  source_vm_id        = element(azurerm_linux_virtual_machine.main.*.id, count.index)
  backup_policy_id    = lookup(var.backup_policy_id, var.environment)
}

resource "azurerm_management_lock" "virtual_machine_lock" {
  count      = var.enable_resource_lock ? length(var.vm_names) : 0
  name       = "delete-lock-virtual-machine"
  scope      = element(azurerm_linux_virtual_machine.main.*.id, count.index)
  lock_level = "CanNotDelete"
  notes      = "Delete lock on virtual machine."
}

resource "azurerm_virtual_machine_extension" "custom_script" {
  name                 = "CustomScriptExtension"
  count                = length(var.vm_names)
  virtual_machine_id   = element(azurerm_linux_virtual_machine.main.*.id, count.index)
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"
  depends_on = [azurerm_linux_virtual_machine.main
  ]

  settings = <<SETTINGS
    {
        "fileUris": [
          "https://storageaccount.blob.core.windows.net/linux/install.deb",
          "https://storageaccount.blob.core.windows.net/linux/install.sh",
          "https://storageaccount.blob.core.windows.net/linux/install.tgz"
        ]
    }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
            "commandToExecute": "sh installs.sh",
            "storageAccountName": "saname",
            "storageAccountKey": "${var.sa_key}"
    }
  PROTECTED_SETTINGS

  tags = var.tags
}