terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.65.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "sharma-rg"
    storage_account_name = "sharma123321"  # <- use module output
    container_name       = "sharma-cont"
    key                  = "sharma.sandeep.tfstate"
  }
}
provider "azurerm" {
features {}
}




resource "azurerm_resource_group" "rg" {
  name     = "sharma-rg"
  location = "central india"
}

resource "azurerm_storage_account" "stg" {
depends_on = [ azurerm_resource_group.rg ]
  name                     = "sharma123321"
  resource_group_name      = "sharma-rg"
  location                 = "central india"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "cont" {
name                  = "sharma-cont"
  storage_account_id = azurerm_storage_account.stg.id
  container_access_type = "private"
}