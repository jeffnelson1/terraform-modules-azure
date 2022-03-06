# Azure SQL Database Terraform Module

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
| [azurerm_management_lock.sql_server_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [azurerm_mssql_server.sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_public_access"></a> [enable\_public\_access](#input\_enable\_public\_access) | Enable public access to the SQL server or not.  True = Yes | `bool` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Region of SQL Server | `string` | n/a | yes |
| <a name="input_sql_admin_name"></a> [sql\_admin\_name](#input\_sql\_admin\_name) | Username for the SQL Admin Account | `string` | n/a | yes |
| <a name="input_sql_admin_password"></a> [sql\_admin\_password](#input\_sql\_admin\_password) | Password of the SQL Admin Account | `string` | n/a | yes |
| <a name="input_sql_server_name"></a> [sql\_server\_name](#input\_sql\_server\_name) | Name of SQL Server | `string` | n/a | yes |
| <a name="input_sql_server_rg_name"></a> [sql\_server\_rg\_name](#input\_sql\_server\_rg\_name) | SQL Server Resource Group Name | `string` | n/a | yes |
| <a name="input_sql_version"></a> [sql\_version](#input\_sql\_version) | Version of SQL Server | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource Tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sql_server_id"></a> [sql\_server\_id](#output\_sql\_server\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->