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
    "sharedservices-eastus2"   = "vnet-eastus2-sharedservices-01"
    "sharedservices-centralus" = "vnet-centralus-sharedservices-01"
  }
}

variable "vnet_rg_name" {
  type        = map(any)
  description = "Virtual Network Resource Group Name selected by environment and region"
  default = {
    "sharedservices-eastus2"   = "rg-network-eastus2-sharedservices"
    "sharedservices-centralus" = "rg-network-centralus-sharedservices"
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