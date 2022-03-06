variable "sql_server_name" {
  type        = string
  description = "Name of SQL Server"
}

variable "sql_server_rg_name" {
  type        = string
  description = "SQL Server Resource Group Name"
}

variable "location" {
  type        = string
  description = "Region of SQL Server"
}

variable "tags" {
  type        = map(any)
  description = "Resource Tags"
}

variable "sql_version" {
  type        = string
  description = "Version of SQL Server"
}

variable "sql_admin_name" {
  type        = string
  description = "Username for the SQL Admin Account"
}

variable "sql_admin_password" {
  type        = string
  description = "Password of the SQL Admin Account"
}

variable "enable_public_access" {
  type        = bool
  description = "Enable public access to the SQL server or not.  True = Yes"
}