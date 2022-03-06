variable "location" {
  type        = string
  description = "Resource Group Location"
}

variable "vm_rg_name" {
  type        = string
  description = "VM Resource Group Name"
}

variable "vm_names" {
  type        = list(any)
  description = "Virtual Machine Name(s)"
}

variable "subnet_name" {
  type        = string
  description = "Subnet Name"
}

variable "enable_resource_lock" {
  type        = bool
  description = "'true' will enable a resource lock.  'false' will disable a resource lock."
}

variable "tags" {
  type        = map(any)
  description = "Resource Tags"
}

variable "environment" {
  type        = string
  description = "Name of Environment"
}

variable "vnet_name" {
  type        = map(any)
  description = "Virtual Network Name selected by environment and region"
  default = {
    "ss-eastus2"     = "vnet-hub-ss-e2-01"
    "ss-centralus"   = "vnet-hub-ss-cu-01"
    "prod-eastus2"   = "vnet-spoke-pd-e2-01"
    "prod-centralus" = "vnet-spoke-pd-cu-01"
  }
}

variable "vnet_rg_name" {
  type        = map(any)
  description = "Virtual Network Resource Group Name selected by environment and region"
  default = {
    "ss-eastus2"     = "rg-network-e2-ss"
    "ss-centralus"   = "rg-network-cu-ss"
    "prod-eastus2"   = "rg-network-e2-prod"
    "prod-centralus" = "rg-network-cu-prod"
  }
}

variable "storage_account_uri" {
  type        = map(any)
  description = "URI of the storage account for boot diagnostics"
  default = {
    "ss-eastus2"     = "https://staccount.blob.core.windows.net/"
    "ss-centralus"   = "https://staccount.blob.core.windows.net/"
    "prod-eastus2"   = "https://staccount.blob.core.windows.net/"
    "prod-centralus" = "https://staccount.blob.core.windows.net/"
  }
}

variable "backup_rsv_rg_name" {
  type        = map(any)
  description = "Backup Recovery Services vault's Resource Group Name"
  default = {
    "ss-eastus2"     = "rg-dr-ss"
    "ss-centralus"   = "rg-dr-cu-ss"
    "prod-eastus2"   = "rg-dr-prod"
    "prod-centralus" = "rg-dr-cu-prod"
  }
}

variable "backup_rsv_name" {
  type        = map(any)
  description = "Backup Recovery Services vault Name"
  default = {
    "ss-eastus2"     = "rsv-backup-e2-ss-01"
    "ss-centralus"   = "rsv-backup-cu-ss-01"
    "prod-eastus2"   = "rsv-backup-e2-pd-01"
    "prod-centralus" = "rsv-backup-cu-pd-01"
  }
}

variable "backup_policy_id" {
  type        = map(any)
  description = "Resource ID of the Backup Policy"
  default = {
    "ss-eastus2"     = "/subscriptions/00/8/backup-pol-1"
    "ss-centralus"   = "/subscriptions/00/8/backup-pol-1"
    "prod-eastus2"   = "/subscriptions/00/8/backup-pol-1"
    "prod-centralus" = "/subscriptions/00/8/backup-pol-1"
  }
}

variable "vm_size" {
  type        = string
  description = "Virtual Machine Size"
}

variable "admin_username" {
  type        = string
  description = "Virtual Machine Admin Username"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH Public Key"
}

variable "os_disk_type" {
  type        = string
  description = "OS Disk Storage Type"
}

variable "os_publisher" {
  type        = string
  description = "Operating System Publisher"
}

variable "os_offer" {
  type        = string
  description = "Operating System Offer"
}

variable "os_sku" {
  type        = string
  description = "Operating System Sku"
}

variable "os_version" {
  type        = string
  description = "Operating System Version"
}

variable "vm_zone" {
  type        = list(any)
  description = "Availability Zone Number for VM"
}

variable "patch_group" {
  type        = list(any)
  description = "Patch group that the VM will be assigned"
}

variable "sa_key" {
  type        = string
  description = "Key for storage account where the post deployment script resides"
  sensitive   = true
}