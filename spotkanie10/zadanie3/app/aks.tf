module "aks" {
  source = "./modules/aks"

  providers = {
    azurerm.aks = azurerm.app
    azurerm.acr = azurerm.shared
  }

  aks_name                   = "${local.prefix}-aks"
  environment                = var.environment
  dns_prefix                 = local.prefix
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id
  acr = {
    id = data.terraform_remote_state.shared.outputs.acr_id
  }
  network = {
    vnet_id   = azurerm_virtual_network.vnet.id
    vnet_name = azurerm_virtual_network.vnet.name
    subnet_id = azurerm_subnet.app.id
  }
  shared_vnet = {
    id   = data.terraform_remote_state.shared.outputs.vnet_id
    name = data.terraform_remote_state.shared.outputs.vnet_name
  }
  rg = {
    id       = data.azurerm_resource_group.rg.id
    name     = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
  }
}
