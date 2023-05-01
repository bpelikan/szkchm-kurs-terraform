locals {
  # prefix = "s22"
  # prefix_shared = "${var.rg_name}-srd-${var.project_name}"
  # prefix = "${var.rg_name}-${var.environment}-${var.project_name}"
  prefix_shared = "chms22-srd-${var.project_name}"
  prefix        = "chms22-${var.environment}-${var.project_name}"
}



variable "sub_id_app" {
  type    = string
  default = "6734621b-0b1a-48d2-9826-ddb7aeed2846"
}

variable "sub_id_shared" {
  type    = string
  default = "6734621b-0b1a-48d2-9826-ddb7aeed2846"
}

variable "rg_name" {
  type    = string
  default = "chm-student22"
}

variable "shared_rg_name" {
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

variable "shared_state_config" {
  type = object({
    resource_group_name  = string
    storage_account_name = string
    container_name       = string
    key                  = string
    subscription_id      = string
  })
}


locals {
  app_address_prefix       = cidrsubnet(var.vnet_address_space, 8, 0)
  data_address_prefix      = cidrsubnet(var.vnet_address_space, 8, 1)
  endpoints_address_prefix = cidrsubnet(var.vnet_address_space, 8, 2)
}
