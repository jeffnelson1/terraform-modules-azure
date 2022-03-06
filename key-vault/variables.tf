variable "kv_rg_name" {
  type        = string
  description = "Resource Group Name of the Key Vault"
}

variable "kv_name" {
  type        = string
  description = "Key Vault Name"
}

variable "location" {
  type        = string
  description = "Region that the key vault resides in."
}

variable "enable_resource_lock" {
  type        = bool
  description = "'true' will enable a resource lock.  'false' will disable a resource lock."
}

variable "enable_access_assignment_1" {
  type        = bool
  description = "'true' will enable a access assignment 1.  'false' will not assign it."
}

variable "object_id_1" {
  type        = string
  description = "Object ID for access assignment 1."
}

variable "key_permissions_1" {
  type        = list(any)
  description = "List of key permissions to the key vault for access assignment 1."
}

variable "secret_permissions_1" {
  type        = list(any)
  description = "List of secret permissions to the key vault for access assignment 1."
}
variable "enable_access_assignment_2" {
  type        = bool
  description = "'true' will enable a access assignment 2.  'false' will not assign it."
}

variable "object_id_2" {
  type        = string
  description = "Object ID for access assignment 2."
}

variable "key_permissions_2" {
  type        = list(any)
  description = "List of key permissions to the key vault for access assignment 2."
}

variable "secret_permissions_2" {
  type        = list(any)
  description = "List of secret permissions to the key vault for access assignment 2."
}

variable "enable_access_assignment_3" {
  type        = bool
  description = "'true' will enable a access assignment 3.  'false' will not assign it."
}

variable "object_id_3" {
  type        = string
  description = "Object ID for access assignment 3."
}

variable "key_permissions_3" {
  type        = list(any)
  description = "List of key permissions to the key vault for access assignment 3."
}

variable "secret_permissions_3" {
  type        = list(any)
  description = "List of secret permissions to the key vault for access assignment 3."
}

variable "tags" {
  type        = map(any)
  description = "Resource Tags"
}

variable "network_acl_default_action" {
  type        = string
  description = "Options: Allow or Deny."
}

variable "allowed_subnet_ids" {
  type        = list(any)
  description = "Subnet IDs that are allowed to access the key vault."
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Allow VMs to access key vault for disk encryption."
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Allow virtual machines to retrieve certificates as secrets from key vault."
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Allow ARM templates to retreive secret from the key vault."
}

variable "eventhub_rule_id" {
  type        = map(any)
  description = "Event Hub Authorization Rule ID"
  default = {
    "eastus2"   = "/subscriptions/00/*/RootManageSharedAccessKey"
    "centralus" = "/subscriptions/01/*/RootManageSharedAccessKey"
  }
}
variable "eventhub_name" {
  type        = map(any)
  description = "Name of Event Hub"
  default = {
    "eastus2"   = "eventhub-01"
    "centralus" = "eventhub-02"
  }
}

variable "private_endpoint_subnet_id" {
  type        = string
  description = "Subnet ID that the private endpoint will reside on."
}