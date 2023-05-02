locals {
  # prefix = "s22"
  # prefix = "${var.rg_name}-srd-${var.project_name}"
  prefix = "chms22-srd-${var.project_name}"
}



variable "sub_id" {
  type    = string
  default = "6734621b-0b1a-48d2-9826-ddb7aeed2846"
}

variable "rg_name" {
  type    = string
  default = "chm-student22"
}

variable "project_name" {
  type    = string
  default = "lab"
}

variable "vnet_address_space" {
  type    = string
  default = "10.0.0.0/16"
}

# Wyłącznie dla celów zadaniowych
variable "vm_password" {
  type = string
  default   = "Testtest123!@#"
  sensitive = true
}

locals {
  endpoints_address_prefix = cidrsubnet(var.vnet_address_space, 8, 0)
  jumphost_address_prefix  = cidrsubnet(var.vnet_address_space, 8, 1)
}
