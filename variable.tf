variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "prefix" {
  description = "The Prefix used for all resources in this demo"
  default     = "ak-demo"
  type        = string
}


variable "os_type" {
  description = "Web app os type Windows/Linux"
  default     = "Windows"
  type        = string
}

variable "sku_name" {
  description = "Web app os type Windows/Linux"
  default     = "P1v2"
  type        = string
}
