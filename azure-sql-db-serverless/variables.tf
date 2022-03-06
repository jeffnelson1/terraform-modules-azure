variable "sql_database_name" {
  type        = string
  description = "Name of SQL Database"
}

variable "sql_server_id" {
  type        = string
  description = "Resource ID of SQL Server"
}

variable "sku_name" {
  type        = string
  description = "Sku name of the SQL Database"
}

variable "tags" {
  type        = map(any)
  description = "Resource Tags"
}

variable "auto_pause_delay_in_minutes" {
  type        = string
  description = "How long a DB is delayed with no activity.  Applies to serverless only."
}

variable "zone_redundant" {
  type        = bool
  description = "Zone redundant or not.  True = Yes"
}

variable "max_size_gb" {
  type        = number
  description = "Max Database size in GB"
}

variable "min_core_capacity" {
  type        = string
  description = "Minimum capacity of CPU cores"
}



