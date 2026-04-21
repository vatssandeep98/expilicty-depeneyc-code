terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.69.0"
    }
  }
    backend "azurerm" {
         resource_group_name  = "motarg"
    storage_account_name = "motasg000022"  # <- use module output
    container_name       = "motacontainer"
    key                  = "yogendra.statefile.tfstate"
  }
}   
provider "azurerm" {
features {}
}

# state file szie 11.76 kb

resource "azurerm_resource_group" "rg" {
  name     = "motarg"
  location = "central india"
}

resource "azurerm_storage_account" "sg" {
depends_on = [ azurerm_resource_group.rg ]
  name                     = "motasg000022"
  resource_group_name      = "motarg"
  location                 = "central india"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "motacontainer"
 storage_account_id = azurerm_storage_account.sg.id
  container_access_type = "private"
}


resource "azurerm_virtual_network" "example" {
  name                = "dhondu-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
 }
