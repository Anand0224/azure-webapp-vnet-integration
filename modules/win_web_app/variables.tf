variable "prefix" {
  description = "The Prefix used for all resources in this demo"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "sku_name"
}

variable "os_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "isubnet" {
  type = string  
}