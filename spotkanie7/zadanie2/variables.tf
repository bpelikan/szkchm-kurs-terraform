locals {
  prefix = "s22"

  hub_vnet_name                        = "${local.prefix}-hub-vnet"
  hub_vnet_address_space               = ["10.0.0.0/16"]
  hub_vnet_sub01_fw_mngm_address_space = ["10.0.0.0/26"]
  hub_vnet_sub02_fw_address_space      = ["10.0.0.64/26"]

  jumphost_vnet_name                   = "${local.prefix}-jumphost-vnet"
  jumphost_vnet_address_space          = ["10.1.0.0/16"]
  jumphost_vnet_subnet01_name          = "${local.prefix}-jumphost-vnet-sub01"
  jumphost_vnet_subnet01_address_space = ["10.1.0.0/24"]

  app_vnet_name                   = "${local.prefix}-app-vnet"
  app_vnet_address_space          = ["10.2.0.0/16"]
  app_vnet_subnet01_name          = "${local.prefix}-app-vnet-sub01"
  app_vnet_subnet01_address_space = ["10.2.0.0/21"]
}


variable "hub_sub_id" {
  type    = string
  default = "6734621b-0b1a-48d2-9826-ddb7aeed2846"
}

variable "spoke_sub_id" {
  type    = string
  default = "790cebac-b0c8-49ec-99ce-4651daa94879"
}

variable "hub_rg_name" {
  type    = string
  default = "chm-student22"
}

variable "spoke_rg_name" {
  type    = string
  default = "chm-student22-a"
}
