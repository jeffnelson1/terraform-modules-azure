variable "eventhub_ns_rg_name" {
  type        = string
  description = "Resource Group Name of the Event Hub Namespace"
}

variable "event_hub_namespace_name" {
  type        = string
  description = "Event Hub Namespace Name"
}

variable "eventhub_ns_location" {
  type        = string
  description = "Region that the event hub resides in."
}

variable "enable_resource_lock" {
  type        = bool
  description = "'true' will enable a resource lock.  'false' will disable a resource lock."
}

variable "eventhub_ns_sku" {
  type        = string
  description = "Sku type of the Event Hub Namespace"
}

variable "eventhub_ns_capacity" {
  type        = string
  description = "Event Hub Namespace Capacity"
}

variable "event_hub_name" {
  type        = string
  description = "Event Hub Name"
}

variable "event_hub_rg_name" {
  type        = string
  description = "Resource Group Name of the Event Hub"
}
variable "event_hub_partition_count" {
  type        = string
  description = "Event Hub partition count"
}

variable "event_hub_message_retention" {
  type        = string
  description = "Event Hub message retention"
}

variable "tags" {
  type        = map(any)
  description = "Resource Tags"
}

variable "la_workspace_id" {
  type        = string
  description = "Log analytics workspace ID for diagnostic logs."
}
