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
    id = data.azurerm_container_registry.acr.id
  }
  network = {
    vnet_id   = azurerm_virtual_network.vnet.id
    vnet_name = azurerm_virtual_network.vnet.name
    subnet_id = azurerm_subnet.app.id
  }
  rg = {
    id       = data.azurerm_resource_group.rg.id
    name     = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
  }
}


moved {
  from = azurerm_kubernetes_cluster.aks
  to   = module.aks.azurerm_kubernetes_cluster.aks
}
moved {
  from = azurerm_kubernetes_cluster_node_pool.user
  to   = module.aks.azurerm_kubernetes_cluster_node_pool.user
}
moved {
  from = azurerm_private_dns_zone.zones["aks"]
  to   = module.aks.azurerm_private_dns_zone.aks
}
moved {
  from = azurerm_private_dns_zone_virtual_network_link.zones["aks"]
  to   = module.aks.azurerm_private_dns_zone_virtual_network_link.aks
}
moved {
  from = azurerm_role_assignment.aks_id_contributor
  to   = module.aks.azurerm_role_assignment.aks_id_contributor
}
moved {
  from = azurerm_role_assignment.aks_id_dns_zone
  to   = module.aks.azurerm_role_assignment.aks_id_dns_zone
}
moved {
  from = azurerm_role_assignment.aks_id_mio
  to   = module.aks.azurerm_role_assignment.aks_id_mio
}
moved {
  from = azurerm_role_assignment.aks_kubelet_id_acr_pull
  to   = module.aks.azurerm_role_assignment.aks_kubelet_id_acr_pull
}
moved {
  from = azurerm_user_assigned_identity.aks
  to   = module.aks.azurerm_user_assigned_identity.aks
}
moved {
  from = azurerm_user_assigned_identity.aks_kubelet
  to   = module.aks.azurerm_user_assigned_identity.aks_kubelet
}