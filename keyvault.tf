resource "azurerm_key_vault" "ali_keyvault" {
  name                       = "kv-ali-terraform"
  location                   = var.location
  resource_group_name        = "rg-ali-terraform"
  tenant_id                  = var.tenant_id
  rbac_authorization_enabled = true

  sku_name = "standard"
}
