variable "primary_location" {
  type        = string
  description = "Recovery Services Vault's Primary Location"
}

variable "secondary_location" {
  type        = string
  description = "Recovery Services Vault's Secondary Location"
}

variable "rsv_rg_name" {
  type        = string
  description = "Resource Group Name of the Recovery Services Vault"
}

variable "rsv_name" {
  type        = string
  description = "Recovery Services Vault Name"
}

variable "enable_resource_lock" {
  type        = bool
  description = "'true' will enable a resource lock.  'false' will disable a resource lock."
}

variable "tags" {
  type        = map(any)
  description = "Resource Tags"
}

variable "vnet_name" {
  type        = map(any)
  description = "Virtual Network Name selected by environment and region"
  default = {
    "ss-eastus2"   = "vnet-e2-ss-01"
    "ss-centralus" = "vnet-cu-ss-01"
  }
}

variable "vnet_rg_name" {
  type        = map(any)
  description = "Virtual Network Resource Group Name selected by environment and region"
  default = {
    "ss-eastus2"   = "rg-network-e2-ss"
    "ss-centralus" = "rg-network-cu-ss"
  }
}

variable "environment_primary_region" {
  type        = string
  description = "Name of Environment for the primary region."
}

variable "environment_secondary_region" {
  type        = string
  description = "Name of Environment for the secondary region."
}