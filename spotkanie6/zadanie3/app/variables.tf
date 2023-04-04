locals {
  # prefix = "s22"
  # prefix_shared = "${var.rg_name}-srd-${var.project_name}"
  # prefix = "${var.rg_name}-${var.environment}-${var.project_name}"
  prefix_shared = "chms22-srd-${var.project_name}"
  prefix        = "chms22-${var.environment}-${var.project_name}"
}



variable "sub_id" {
  type    = string
  default = "e0a3aa17-0bd9-4dc5-803d-6ea393ade30a"
}

variable "rg_name" {
  type    = string
  default = "chm-student22"
}

variable "environment" {
  type = string
}

variable "project_name" {
  type    = string
  default = "lab"
}

variable "vnet_address_space" {
  type    = string
  default = "10.1.0.0/16"
}

locals {
  app_address_prefix       = cidrsubnet(var.vnet_address_space, 8, 0)
  data_address_prefix      = cidrsubnet(var.vnet_address_space, 8, 1)
  endpoints_address_prefix = cidrsubnet(var.vnet_address_space, 8, 2)
}