locals {
  # prefix = "s22"
  prefix = "${var.rg_name}-srd-${var.project_name}"
}



variable "sub_id" {
  type    = string
  default = "e0a3aa17-0bd9-4dc5-803d-6ea393ade30a"
}

variable "rg_name" {
  type    = string
  default = "chm-student22"
}

variable "project_name" {
  type = string
  default = "lab"
}

variable "vnet_address_space" {
  type = string
  default = "10.0.0.0/16"
}

locals {
  endpoints_address_prefix = cidrsubnet(var.vnet_address_space, 8, 0)
}