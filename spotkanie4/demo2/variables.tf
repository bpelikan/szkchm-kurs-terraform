locals {
  passwords = {
    secret1            = "secretvalue123"
    secret2            = "secretvalue321"
    keyvault-secret-01 = "terraform-is-cool-1"
    keyvault-secret-02 = "terraform-is-cool-2"
  }
  vault_access_policy = {
    chmstudent0 = {
      object_id          = "ea3c2cef-72c7-41b2-9099-84d9fe95fdaf"
      secret_permissions = ["Get", "List", "Set"]
    }
    chmstudent29 = {
      object_id          = "e84deb1e-45bb-488a-be1b-46c3b50494b5"
      secret_permissions = ["Get", "List", "Set"]
    }
    myuser = {
      object_id          = data.azurerm_client_config.current.object_id
      secret_permissions = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
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

variable "key_vault_name" {
  type    = string
  default = "kv-bp-dev-0315"
}