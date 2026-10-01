resource "azurerm_service_plan" "ali_plan" {
  name                = "asp-ali"
  resource_group_name = "rg-ali-terraform"
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "ali_app" {
  name                = "ali-terraform-app"
  resource_group_name = "rg-ali-terraform"
  location            = var.location
  service_plan_id     = azurerm_service_plan.ali_plan.id

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }
}
