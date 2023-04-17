variable "kv_name" {
  type = string
}

variable "rg" {
  type = object({
    name     = string
    location = string
  })
}

variable "access_policies" {
  type = map(object({
    tenant_id           = string
    object_id           = string
    key_permissions     = list(string)
    secret_permissions  = list(string)
    storage_permissions = list(string)
  }))
}

variable "endpiont_subnet_id" {
  type = string
}

variable "private_dns_zone_id" {
  type    = string
  default = null
}

variable "vnet" {
  description = "Required in case of creating private DNS Zone"
  type = object({
    id   = string
    name = string
  })
  default = null
}
