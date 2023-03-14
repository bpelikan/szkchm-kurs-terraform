locals {
  passwords = {
    secret1            = "secretvalue123"
    secret2            = "secretvalue321"
    keyvault-secret-01 = "terraform-is-cool-1"
    keyvault-secret-02 = "terraform-is-cool-2"
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

variable "key_vault_name" {
  type    = string
  default = "kv-bp-dev-0314"
}