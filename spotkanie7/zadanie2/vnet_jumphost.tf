module "jumphist" {
  source = "./modules/spoke"
  providers = {
    azurerm.hub = azurerm.hub
    azurerm.spoke = azurerm.spoke
   }

  student_name       = "chm-student22"
  app_name           = "jh"
  location           = data.azurerm_resource_group.spoke.location
  rg_name            = data.azurerm_resource_group.spoke.name
  hub_rg_name        = azurerm_virtual_network.hub_vnet.resource_group_name
  hub_vnet_name      = azurerm_virtual_network.hub_vnet.name
  hub_vnet_id        = azurerm_virtual_network.hub_vnet.id
  vnet_address_space = local.jumphost_vnet_address_space
  subnets = {
    "app" = {
      address_space = local.jumphost_vnet_subnet01_address_space
    }
  }
}