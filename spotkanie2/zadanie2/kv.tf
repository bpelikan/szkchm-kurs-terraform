locals {
  passwords = {
    secret1 = "secretvalue123"
    secret2 = "secretvalue321"
    keyvault-secret-01 = "terraform-is-cool-1"
    keyvault_secret_02 = "terraform-is-cool_2"
  }
}


resource "azurerm_key_vault" "kv_bp_dev_01" {
  name                        = var.key_vault_name
  location                    = data.azurerm_resource_group.main_rg.location
  resource_group_name         = data.azurerm_resource_group.main_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List"
    ]

    secret_permissions = [
      "Get", "List", "Delete", "Purge", "Set"
    ]
  }
}


# resource "azurerm_key_vault_secret" "keyvault_secret_01" {
#   name         = "keyvault-secret-01"
#   value        = "terraform-is-cool"
#   key_vault_id = azurerm_key_vault.kv_bp_dev_01.id
# }