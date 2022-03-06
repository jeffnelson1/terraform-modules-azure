# Event Hub Terraform Module

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
| [azurerm_eventhub.event_hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |
| [azurerm_eventhub_namespace.eh_namespace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) | resource |
| [azurerm_management_lock.kv_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [azurerm_monitor_diagnostic_setting.diag_logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_resource_lock"></a> [enable\_resource\_lock](#input\_enable\_resource\_lock) | 'true' will enable a resource lock.  'false' will disable a resource lock. | `bool` | n/a | yes |
| <a name="input_event_hub_message_retention"></a> [event\_hub\_message\_retention](#input\_event\_hub\_message\_retention) | Event Hub message retention | `string` | n/a | yes |
| <a name="input_event_hub_name"></a> [event\_hub\_name](#input\_event\_hub\_name) | Event Hub Name | `string` | n/a | yes |
| <a name="input_event_hub_namespace_name"></a> [event\_hub\_namespace\_name](#input\_event\_hub\_namespace\_name) | Event Hub Namespace Name | `string` | n/a | yes |
| <a name="input_event_hub_partition_count"></a> [event\_hub\_partition\_count](#input\_event\_hub\_partition\_count) | Event Hub partition count | `string` | n/a | yes |
| <a name="input_event_hub_rg_name"></a> [event\_hub\_rg\_name](#input\_event\_hub\_rg\_name) | Resource Group Name of the Event Hub | `string` | n/a | yes |
| <a name="input_eventhub_ns_capacity"></a> [eventhub\_ns\_capacity](#input\_eventhub\_ns\_capacity) | Event Hub Namespace Capacity | `string` | n/a | yes |
| <a name="input_eventhub_ns_location"></a> [eventhub\_ns\_location](#input\_eventhub\_ns\_location) | Region that the event hub resides in. | `string` | n/a | yes |
| <a name="input_eventhub_ns_rg_name"></a> [eventhub\_ns\_rg\_name](#input\_eventhub\_ns\_rg\_name) | Resource Group Name of the Event Hub Namespace | `string` | n/a | yes |
| <a name="input_eventhub_ns_sku"></a> [eventhub\_ns\_sku](#input\_eventhub\_ns\_sku) | Sku type of the Event Hub Namespace | `string` | n/a | yes |
| <a name="input_la_workspace_id"></a> [la\_workspace\_id](#input\_la\_workspace\_id) | Log analytics workspace ID for diagnostic logs. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource Tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_event_hub_ns_resource_id"></a> [event\_hub\_ns\_resource\_id](#output\_event\_hub\_ns\_resource\_id) | The resource ID of the event hub namespace. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->