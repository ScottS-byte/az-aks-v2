resource "azurerm_kubernetes_cluster" "this" {
  name                    = var.name
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = var.dns_prefix
  kubernetes_version      = var.kubernetes_version
  node_resource_group     = var.node_resource_group
  private_cluster_enabled = var.private_cluster_enabled
  sku_tier                = "Free"
  default_node_pool {
    enable_auto_scaling = var.default_node_pool.enable_auto_scaling
    max_count           = var.default_node_pool.max_count
    min_count           = var.default_node_pool.min_count
    max_pods            = var.default_node_pool.max_pods
    name                = var.default_node_pool.name
    node_count          = var.default_node_pool.node_count
    os_sku              = var.default_node_pool.os_sku
    type                = var.default_node_pool.type
    vnet_subnet_id      = var.default_node_pool.vnet_subnet_id
    vm_size             = var.default_node_pool.vm_size
  }
  identity {
    type = "SystemAssigned"
  }
  tags = merge(
    var.additional_tags,
    {
      created-by = "iac-tf"
    },
  )
}
