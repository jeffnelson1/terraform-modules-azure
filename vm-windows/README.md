# Windows VM Terraform Module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_backup_protected_vm.vm1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_protected_vm) | resource |
| [azurerm_key_vault_key.kek](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_key_vault_key.kek_secondary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_managed_disk.data_disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_managed_disk.data_disk_2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_managed_disk.data_disk_3](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_management_lock.virtual_machine_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [azurerm_network_interface.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_virtual_machine_data_disk_attachment.data_disk_2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_virtual_machine_data_disk_attachment.data_disk_3](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_virtual_machine_data_disk_attachment.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_virtual_machine_extension.Datadog](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_machine_extension.custom_script](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_machine_extension.domain_join](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_windows_virtual_machine.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine) | resource |
| [azurerm_subnet.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Virtual Machine Admin Password | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Virtual Machine Admin Username | `string` | n/a | yes |
| <a name="input_backup_policy_id"></a> [backup\_policy\_id](#input\_backup\_policy\_id) | Resource ID of the Backup Policy | `map(any)` | <pre>{<br>  "prod-centralus": "/subscriptions/00/8/backup-pol-1",<br>  "prod-eastus2": "/subscriptions/00/8/backup-pol-1",<br>  "ss-centralus": "/subscriptions/00/8/backup-pol-1",<br>  "ss-eastus2": "/subscriptions/00/8/backup-pol-1"<br>}</pre> | no |
| <a name="input_backup_rsv_name"></a> [backup\_rsv\_name](#input\_backup\_rsv\_name) | Backup Recovery Services vault Name | `map(any)` | <pre>{<br>  "prod-centralus": "rsv-backup-cu-pd-01",<br>  "prod-eastus2": "rsv-backup-e2-pd-01",<br>  "ss-centralus": "rsv-backup-cu-ss-01",<br>  "ss-eastus2": "rsv-backup-e2-ss-01"<br>}</pre> | no |
| <a name="input_backup_rsv_rg_name"></a> [backup\_rsv\_rg\_name](#input\_backup\_rsv\_rg\_name) | Backup Recovery Services vault's Resource Group Name | `map(any)` | <pre>{<br>  "prod-centralus": "rg-dr-cu-prod",<br>  "prod-eastus2": "rg-dr-prod",<br>  "ss-centralus": "rg-dr-cu-ss",<br>  "ss-eastus2": "rg-dr-ss"<br>}</pre> | no |
| <a name="input_create_data_disk_2"></a> [create\_data\_disk\_2](#input\_create\_data\_disk\_2) | Create a second data disk.  true or false? | `bool` | n/a | yes |
| <a name="input_create_data_disk_3"></a> [create\_data\_disk\_3](#input\_create\_data\_disk\_3) | Create a third data disk.  true or false? | `bool` | n/a | yes |
| <a name="input_data_disk_2_disk_type"></a> [data\_disk\_2\_disk\_type](#input\_data\_disk\_2\_disk\_type) | Data Disk 2 Storage Type | `string` | n/a | yes |
| <a name="input_data_disk_2_size_gb"></a> [data\_disk\_2\_size\_gb](#input\_data\_disk\_2\_size\_gb) | Data Disk 2 Size in GB | `string` | n/a | yes |
| <a name="input_data_disk_3_disk_type"></a> [data\_disk\_3\_disk\_type](#input\_data\_disk\_3\_disk\_type) | Data Disk 3 Storage Type | `string` | n/a | yes |
| <a name="input_data_disk_3_size_gb"></a> [data\_disk\_3\_size\_gb](#input\_data\_disk\_3\_size\_gb) | Data Disk 3 Size in GB | `string` | n/a | yes |
| <a name="input_data_disk_rg_name"></a> [data\_disk\_rg\_name](#input\_data\_disk\_rg\_name) | Data Disk Resource Group Name | `string` | n/a | yes |
| <a name="input_data_disk_size_gb"></a> [data\_disk\_size\_gb](#input\_data\_disk\_size\_gb) | Data Disk Size in GB | `string` | n/a | yes |
| <a name="input_data_disk_type"></a> [data\_disk\_type](#input\_data\_disk\_type) | Data Disk Storage Type | `string` | n/a | yes |
| <a name="input_datadog_api"></a> [datadog\_api](#input\_datadog\_api) | API for the Datadog VM extension | `string` | n/a | yes |
| <a name="input_disk_zone"></a> [disk\_zone](#input\_disk\_zone) | Availability Zone Number for data disk | `list(any)` | n/a | yes |
| <a name="input_domain_join_pass"></a> [domain\_join\_pass](#input\_domain\_join\_pass) | Password for joining VM to the specified domain. | `string` | n/a | yes |
| <a name="input_domain_join_userid"></a> [domain\_join\_userid](#input\_domain\_join\_userid) | AD User ID for joining VM to the specified domain. | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Resource ID of the Backup Policy | `map(any)` | <pre>{<br>  "prod-centralus": "one.company.com",<br>  "prod-eastus2": "one.company.com",<br>  "ss-centralus": "company.com",<br>  "ss-eastus2": "company.com"<br>}</pre> | no |
| <a name="input_enable_azure_site_recovery"></a> [enable\_azure\_site\_recovery](#input\_enable\_azure\_site\_recovery) | Enable Azure Site Recovery.  true or false? | `bool` | n/a | yes |
| <a name="input_enable_resource_lock"></a> [enable\_resource\_lock](#input\_enable\_resource\_lock) | 'true' will enable a resource lock.  'false' will disable a resource lock. | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of Environment | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Resource Group Location | `string` | n/a | yes |
| <a name="input_os_disk_type"></a> [os\_disk\_type](#input\_os\_disk\_type) | OS Disk Storage Type | `string` | n/a | yes |
| <a name="input_ou_target"></a> [ou\_target](#input\_ou\_target) | Resource ID of the Backup Policy | `map(any)` | <pre>{<br>  "prod-centralus": "OU path",<br>  "prod-eastus2": "OU path",<br>  "ss-centralus": "OU path",<br>  "ss-eastus2": "OU path"<br>}</pre> | no |
| <a name="input_patch_group"></a> [patch\_group](#input\_patch\_group) | Patch group that the VM will be assigned | `list(any)` | n/a | yes |
| <a name="input_sa_key"></a> [sa\_key](#input\_sa\_key) | Key for storage account where the post deployment script resides | `string` | n/a | yes |
| <a name="input_storage_account_uri"></a> [storage\_account\_uri](#input\_storage\_account\_uri) | URI of the storage account for boot diagnostics | `map(any)` | <pre>{<br>  "prod-centralus": "https://staccount.blob.core.windows.net/",<br>  "prod-eastus2": "https://staccount.blob.core.windows.net/",<br>  "ss-centralus": "https://staccount.blob.core.windows.net/",<br>  "ss-eastus2": "https://staccount.blob.core.windows.net/"<br>}</pre> | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Subnet Name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource Tags | `map(any)` | n/a | yes |
| <a name="input_vault_id"></a> [vault\_id](#input\_vault\_id) | Resource ID of the key vault | `string` | n/a | yes |
| <a name="input_vault_id_secondary"></a> [vault\_id\_secondary](#input\_vault\_id\_secondary) | Resource ID of the key vault in the secondary region. | `string` | n/a | yes |
| <a name="input_vault_url"></a> [vault\_url](#input\_vault\_url) | URL of the key vault | `string` | n/a | yes |
| <a name="input_vm_names"></a> [vm\_names](#input\_vm\_names) | Virtual Machine Name(s) | `list(any)` | n/a | yes |
| <a name="input_vm_rg_name"></a> [vm\_rg\_name](#input\_vm\_rg\_name) | VM Resource Group Name | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Virtual Machine Size | `string` | n/a | yes |
| <a name="input_vm_zone"></a> [vm\_zone](#input\_vm\_zone) | Availability Zone Number for VM | `list(any)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Virtual Network Name selected by environment and region | `map(any)` | <pre>{<br>  "prod-centralus": "vnet-spoke-pd-cu-01",<br>  "prod-eastus2": "vnet-spoke-pd-e2-01",<br>  "ss-centralus": "vnet-hub-ss-cu-01",<br>  "ss-eastus2": "vnet-hub-ss-e2-01"<br>}</pre> | no |
| <a name="input_vnet_rg_name"></a> [vnet\_rg\_name](#input\_vnet\_rg\_name) | Virtual Network Resource Group Name selected by environment and region | `map(any)` | <pre>{<br>  "prod-centralus": "rg-network-cu-prod",<br>  "prod-eastus2": "rg-network-e2-prod",<br>  "ss-centralus": "rg-network-cu-ss",<br>  "ss-eastus2": "rg-network-e2-ss"<br>}</pre> | no |
| <a name="input_windows_os_version"></a> [windows\_os\_version](#input\_windows\_os\_version) | Windows OS Version for VM | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The resource ID of the subnet. |
| <a name="output_vm_resource_id"></a> [vm\_resource\_id](#output\_vm\_resource\_id) | The resource ID of the VM. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->