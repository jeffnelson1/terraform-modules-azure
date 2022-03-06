# Recovery Services Vault Terraform Module

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
| [azurerm_management_lock.rsv_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [azurerm_recovery_services_vault.vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/recovery_services_vault) | resource |
| [azurerm_site_recovery_fabric.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/site_recovery_fabric) | resource |
| [azurerm_site_recovery_fabric.secondary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/site_recovery_fabric) | resource |
| [azurerm_site_recovery_network_mapping.recovery-mapping-pri-to-sec](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/site_recovery_network_mapping) | resource |
| [azurerm_site_recovery_network_mapping.recovery-mapping-sec-to-pri](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/site_recovery_network_mapping) | resource |
| [azurerm_site_recovery_protection_container.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/site_recovery_protection_container) | resource |
| [azurerm_site_recovery_protection_container.secondary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/site_recovery_protection_container) | resource |
| [azurerm_site_recovery_protection_container_mapping.pri-to-sec-container-mapping](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/site_recovery_protection_container_mapping) | resource |
| [azurerm_site_recovery_protection_container_mapping.sec-to-pri-container-mapping](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/site_recovery_protection_container_mapping) | resource |
| [azurerm_site_recovery_replication_policy.fourHourPolicy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/site_recovery_replication_policy) | resource |
| [azurerm_site_recovery_replication_policy.oneHourPolicy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/site_recovery_replication_policy) | resource |
| [azurerm_site_recovery_replication_policy.twelveHourPolicy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/site_recovery_replication_policy) | resource |
| [azurerm_site_recovery_replication_policy.twoHourPolicy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/site_recovery_replication_policy) | resource |
| [azurerm_virtual_network.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |
| [azurerm_virtual_network.secondary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_resource_lock"></a> [enable\_resource\_lock](#input\_enable\_resource\_lock) | 'true' will enable a resource lock.  'false' will disable a resource lock. | `bool` | n/a | yes |
| <a name="input_environment_primary_region"></a> [environment\_primary\_region](#input\_environment\_primary\_region) | Name of Environment for the primary region. | `string` | n/a | yes |
| <a name="input_environment_secondary_region"></a> [environment\_secondary\_region](#input\_environment\_secondary\_region) | Name of Environment for the secondary region. | `string` | n/a | yes |
| <a name="input_primary_location"></a> [primary\_location](#input\_primary\_location) | Recovery Services Vault's Primary Location | `string` | n/a | yes |
| <a name="input_rsv_name"></a> [rsv\_name](#input\_rsv\_name) | Recovery Services Vault Name | `string` | n/a | yes |
| <a name="input_rsv_rg_name"></a> [rsv\_rg\_name](#input\_rsv\_rg\_name) | Resource Group Name of the Recovery Services Vault | `string` | n/a | yes |
| <a name="input_secondary_location"></a> [secondary\_location](#input\_secondary\_location) | Recovery Services Vault's Secondary Location | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource Tags | `map(any)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Virtual Network Name selected by environment and region | `map(any)` | <pre>{<br>  "ss-centralus": "vnet-cu-ss-01",<br>  "ss-eastus2": "vnet-e2-ss-01"<br>}</pre> | no |
| <a name="input_vnet_rg_name"></a> [vnet\_rg\_name](#input\_vnet\_rg\_name) | Virtual Network Resource Group Name selected by environment and region | `map(any)` | <pre>{<br>  "ss-centralus": "rg-network-cu-ss",<br>  "ss-eastus2": "rg-network-e2-ss"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rsv_resource_id"></a> [rsv\_resource\_id](#output\_rsv\_resource\_id) | The resource ID of the Recovery Services vault. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->