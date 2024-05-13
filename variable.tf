variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = "rg-terraform-ak"
  description = "Resource group name in your Azure subscription."
}

variable "integrationsubnet_name" {
  type    = string
  default = "integrationsubnet"
}

variable "endpointsubnet_name" {
  type    = string
  default = "endpointsubnet"
}

variable "appserviceplan" {
  type    = string
  default = "appserviceplan"
}

variable "frontend-app-name" {
  type    = string
  default = "frontend-demo-app"
}

variable "prefix" {
  description = "The Prefix used for all resources in this demo"
  default     = "ak-demo"
  type        = string
}