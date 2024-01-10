provider "azurerm" {
  features = {}
}

resource "azurerm_resource_group" "azure-functions-test-rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.azure-functions-test-rg.name
  location                 = azurerm_resource_group.azure-functions-test-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.azure-functions-test-rg.location
  resource_group_name = azurerm_resource_group.azure-functions-test-rg.name

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}

resource "azurerm_function_app" "example" {
  name                       = var.function_app_name
  location                   = azurerm_resource_group.azure-functions-test-rg.location
  resource_group_name        = azurerm_resource_group.azure-functions-test-rg.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
}
