terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.69.0"
    }
    }
    }
provider "azurerm" {
 features { }
}








module "rg" {
source = "../child code/rg"
rg-name = "yogi-rg"
rg-location = "east us"
}

module "vnet" {
  depends_on = [ module.rg ]
source = "../child code/vnet"
vnet-name = "sachin-vnet"
vnet-location = "east us"
rg-name = "yogi-rg"
}
