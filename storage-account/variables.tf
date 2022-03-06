variable "storage_account_name" {
  type        = string
  description = "Storage Account Name"
}

variable "rg_name" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Region that the storage account resides in."
}

variable "account_tier" {
  type        = string
  description = "Defines the Tier to use for this storage account."
}

variable "replication_type" {
  type        = string
  description = "Defines the type of replication to use for this storage account."
}

variable "account_kind" {
  type        = string
  description = "Defines the Kind of account."
}

variable "access_tier" {
  type        = string
  description = "Defines the Tier to use for this storage account."
}

variable "tags" {
  type        = map(any)
  description = "Resource Tags"
}

variable "enable_resource_lock" {
  type        = bool
  description = "'true' will enable a resource lock.  'false' will disable a resource lock."
}
