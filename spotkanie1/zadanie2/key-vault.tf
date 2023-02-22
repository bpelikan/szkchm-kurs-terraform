resource "azurerm_key_vault" "kv-bp-dev-01" {
  name                        = var.key-vault-name
  location                    = data.azurerm_resource_group.main_rg.location
  resource_group_name         = data.azurerm_resource_group.main_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    #object_id = data.azuread_user.user.id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List"
    ]

    secret_permissions = [
      "Get", "List", "Delete", "Purge", "Set"
    ]

    storage_permissions = [
      "Get", "List"
    ]
  }
}


# resource "azurerm_key_vault_secret" "keyvault-secret-01" {
#   name         = "keyvault-secret-01"
#   value        = "terraform-is-cool"
#   key_vault_id = azurerm_key_vault.kv-bp-dev-01.id
# }