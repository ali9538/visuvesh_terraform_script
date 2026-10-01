resource "azurerm_storage_account" "ali_storage" {
  name                     = "ali9storageaccount"
  resource_group_name      = "rg-ali-terraform"
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
