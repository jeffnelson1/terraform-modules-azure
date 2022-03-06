variable "location" {
  type        = string
  description = "Resource Group Location"
}

variable "name" {
  type        = string
  description = "Resource Group Name"
}

variable "tags" {
  type        = map(any)
  description = "Resource Tags"
}
