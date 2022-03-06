variable "location" {
  type        = string
  description = "Log Analytics Location"
}

variable "workspace_rg_name" {
  type        = string
  description = "Log Analytics Resource Group Name"
}

variable "workspace_name" {
  type        = string
  description = "Log Analytics Workspace Name"
}

variable "tags" {
  type        = map(any)
  description = "Resource Tags"
}

variable "retention_in_days" {
  type        = number
  description = "Number of days of log retention"
}

variable "enable_resource_lock" {
  type        = bool
  description = "'true' will enable a resource lock.  'false' will disable a resource lock."
}