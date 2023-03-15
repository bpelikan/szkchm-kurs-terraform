resource "azurerm_key_vault" "kv_01" {
  name                        = var.key_vault_name
  location                    = data.azurerm_resource_group.main_rg.location
  resource_group_name         = data.azurerm_resource_group.main_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  dynamic "access_policy" {
    for_each = local.vault_access_policy
    content {
      tenant_id          = data.azurerm_client_config.current.tenant_id
      object_id          = access_policy.value.object_id
      secret_permissions = access_policy.value.secret_permissions
    }
  }
}


resource "azurerm_key_vault_secret" "keyvault_secret" {
  for_each = local.passwords

  name         = each.key
  value        = each.value
  key_vault_id = azurerm_key_vault.kv_01.id
}