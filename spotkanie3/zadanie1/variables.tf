locals {
  passwords = [
    "secretvalue123",
    "secretvalue321"
  ]
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
  default = "kv-bp-dev-04"
}