locals {
  vnet_name_s22 = "${var.vnet_name}-s22"
  subnet_name_s22 = "${var.vnet_name}-${var.subnet_name}-s22"
}


variable "sub_id" {
  type    = string
  default = "e0a3aa17-0bd9-4dc5-803d-6ea393ade30a"
}

variable "main_rg_name" {
  type    = string
  default = "chm-student22"
}


variable "vnet_name" {
  type    = string
  default = "vnet01"
}

variable "subnet_name" {
  type    = string
  default = "subnet01"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  type    = list(string)
  default = ["10.0.0.0/24"]
}