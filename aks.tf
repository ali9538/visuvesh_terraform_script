resource "azurerm_kubernetes_cluster" "ali_aks" {
  name                = "aks-ali"
  location            = var.location
  resource_group_name = "rg-ali-terraform"
  dns_prefix          = "aks-ali"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }
  node_provisioning_profile {
    mode = "Auto"
  }
  identity {
    type = "SystemAssigned"
  }
}
