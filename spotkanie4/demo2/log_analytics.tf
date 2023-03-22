resource "azurerm_log_analytics_workspace" "log_analytics_01" {
  name                = "s22-chm-la"
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}


resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting_kv_01" {
  name                       = "${azurerm_key_vault.kv_01.name}-export"
  target_resource_id         = azurerm_key_vault.kv_01.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_01.id


  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.azurerm_monitor_diagnostic_setting_key_vault.log_category_types
    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.azurerm_monitor_diagnostic_setting_key_vault.metrics
    content {
      category = metric.value
      enabled  = true
    }
  }
}


data "azurerm_monitor_diagnostic_categories" "azurerm_monitor_diagnostic_setting_key_vault" {
  #ID Serwisu dla którego chcemy sprawdzić metryki i logi, które możemy logować
  resource_id = azurerm_key_vault.kv_01.id
}