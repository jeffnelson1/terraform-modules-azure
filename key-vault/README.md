# Key Vault Terraform Module

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
| [azurerm_key_vault.keyvault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.assignment_1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.assignment_2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.assignment_3](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_management_lock.kv_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [azurerm_monitor_diagnostic_setting.diag_logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_private_endpoint.endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_subnet_ids"></a> [allowed\_subnet\_ids](#input\_allowed\_subnet\_ids) | Subnet IDs that are allowed to access the key vault. | `list(any)` | n/a | yes |
| <a name="input_enable_access_assignment_1"></a> [enable\_access\_assignment\_1](#input\_enable\_access\_assignment\_1) | 'true' will enable a access assignment 1.  'false' will not assign it. | `bool` | n/a | yes |
| <a name="input_enable_access_assignment_2"></a> [enable\_access\_assignment\_2](#input\_enable\_access\_assignment\_2) | 'true' will enable a access assignment 2.  'false' will not assign it. | `bool` | n/a | yes |
| <a name="input_enable_access_assignment_3"></a> [enable\_access\_assignment\_3](#input\_enable\_access\_assignment\_3) | 'true' will enable a access assignment 3.  'false' will not assign it. | `bool` | n/a | yes |
| <a name="input_enable_resource_lock"></a> [enable\_resource\_lock](#input\_enable\_resource\_lock) | 'true' will enable a resource lock.  'false' will disable a resource lock. | `bool` | n/a | yes |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Allow virtual machines to retrieve certificates as secrets from key vault. | `bool` | n/a | yes |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Allow VMs to access key vault for disk encryption. | `bool` | n/a | yes |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Allow ARM templates to retreive secret from the key vault. | `bool` | n/a | yes |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | Name of Event Hub | `map(any)` | <pre>{<br>  "centralus": "eventhub-02",<br>  "eastus2": "eventhub-01"<br>}</pre> | no |
| <a name="input_eventhub_rule_id"></a> [eventhub\_rule\_id](#input\_eventhub\_rule\_id) | Event Hub Authorization Rule ID | `map(any)` | <pre>{<br>  "centralus": "/subscriptions/01/*/RootManageSharedAccessKey",<br>  "eastus2": "/subscriptions/00/*/RootManageSharedAccessKey"<br>}</pre> | no |
| <a name="input_key_permissions_1"></a> [key\_permissions\_1](#input\_key\_permissions\_1) | List of key permissions to the key vault for access assignment 1. | `list(any)` | n/a | yes |
| <a name="input_key_permissions_2"></a> [key\_permissions\_2](#input\_key\_permissions\_2) | List of key permissions to the key vault for access assignment 2. | `list(any)` | n/a | yes |
| <a name="input_key_permissions_3"></a> [key\_permissions\_3](#input\_key\_permissions\_3) | List of key permissions to the key vault for access assignment 3. | `list(any)` | n/a | yes |
| <a name="input_kv_name"></a> [kv\_name](#input\_kv\_name) | Key Vault Name | `string` | n/a | yes |
| <a name="input_kv_rg_name"></a> [kv\_rg\_name](#input\_kv\_rg\_name) | Resource Group Name of the Key Vault | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Region that the key vault resides in. | `string` | n/a | yes |
| <a name="input_network_acl_default_action"></a> [network\_acl\_default\_action](#input\_network\_acl\_default\_action) | Options: Allow or Deny. | `string` | n/a | yes |
| <a name="input_object_id_1"></a> [object\_id\_1](#input\_object\_id\_1) | Object ID for access assignment 1. | `string` | n/a | yes |
| <a name="input_object_id_2"></a> [object\_id\_2](#input\_object\_id\_2) | Object ID for access assignment 2. | `string` | n/a | yes |
| <a name="input_object_id_3"></a> [object\_id\_3](#input\_object\_id\_3) | Object ID for access assignment 3. | `string` | n/a | yes |
| <a name="input_private_endpoint_subnet_id"></a> [private\_endpoint\_subnet\_id](#input\_private\_endpoint\_subnet\_id) | Subnet ID that the private endpoint will reside on. | `string` | n/a | yes |
| <a name="input_secret_permissions_1"></a> [secret\_permissions\_1](#input\_secret\_permissions\_1) | List of secret permissions to the key vault for access assignment 1. | `list(any)` | n/a | yes |
| <a name="input_secret_permissions_2"></a> [secret\_permissions\_2](#input\_secret\_permissions\_2) | List of secret permissions to the key vault for access assignment 2. | `list(any)` | n/a | yes |
| <a name="input_secret_permissions_3"></a> [secret\_permissions\_3](#input\_secret\_permissions\_3) | List of secret permissions to the key vault for access assignment 3. | `list(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource Tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keyvault_resource_id"></a> [keyvault\_resource\_id](#output\_keyvault\_resource\_id) | The resource ID of the Key Vault. |
| <a name="output_vault_uri"></a> [vault\_uri](#output\_vault\_uri) | URI of the Key Vault. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->