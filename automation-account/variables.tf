variable "automation_account_name" {
  type        = string
  description = "Automation Account Name"
}

variable "rg_name" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Region that the storage account resides in."
}

variable "tags" {
  type        = map(any)
  description = "Resource Tags"
}

variable "enable_resource_lock" {
  type        = bool
  description = "'true' will enable a resource lock.  'false' will disable a resource lock."
}
