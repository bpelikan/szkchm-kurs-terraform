locals {
  prefix = "s22"

  hub_prefix                           = "${local.prefix}-hub"
  hub_vnet_name                        = "${local.hub_prefix}-vnet"
  hub_vnet_address_space               = ["10.0.0.0/16"]
  hub_vnet_sub01_fw_mngm_address_space = ["10.0.0.0/26"]
  hub_vnet_sub02_fw_address_space      = ["10.0.0.64/26"]

  jumphost_prefix                      = "${local.prefix}-jumphost"
  jumphost_vnet_name                   = "${local.jumphost_prefix}-vnet"
  jumphost_vnet_address_space          = ["10.1.0.0/16"]
  jumphost_vnet_subnet01_name          = "${local.jumphost_vnet_name}-sub01"
  jumphost_vnet_subnet01_address_space = ["10.1.0.0/24"]

  app_prefix                      = "${local.prefix}-app"
  app_vnet_name                   = "${local.app_prefix}-vnet"
  app_vnet_address_space          = ["10.2.0.0/16"]
  app_vnet_subnet01_name          = "${local.app_vnet_name}-sub01"
  app_vnet_subnet01_address_space = ["10.2.0.0/21"]

  hub_fw_rules = {
    HTTP = {
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_addresses = ["*"]
      destination_ports     = ["80"]
    },
    HTTPS = {
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_addresses = ["*"]
      destination_ports     = ["443"]
    }
  }


}



variable "sub_id" {
  type    = string
  default = "e0a3aa17-0bd9-4dc5-803d-6ea393ade30a"
}

variable "main_rg_name" {
  type    = string
  default = "chm-student22"
}

# Wyłącznie dla celów zadaniowych
variable "username" {
  type      = string
  default   = "admuser"
  sensitive = true
}

# Wyłącznie dla celów zadaniowych
variable "password" {
  type = string
  # default = "rlystrongpass!123"
  default   = "Testtest123!@#"
  sensitive = true
}