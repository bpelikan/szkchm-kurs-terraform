locals {
  prefix             = "s22"
  hub_vnet_name      = "${local.prefix}-hub-vnet"
  jumphost_vnet_name = "${local.prefix}-jumphost-vnet"
  app_vnet_name      = "${local.prefix}-app-vnet"

  hub_vnet_address_space      = ["10.0.0.0/16"]
  jumphost_vnet_address_space = ["10.1.0.0/16"]
  app_vnet_address_space      = ["10.2.0.0/16"]
}



variable "sub_id" {
  type    = string
  default = "e0a3aa17-0bd9-4dc5-803d-6ea393ade30a"
}

variable "main_rg_name" {
  type    = string
  default = "chm-student22"
}
