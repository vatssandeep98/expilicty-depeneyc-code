resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet-name
  location            = var.vnet-location
  resource_group_name = var.rg-name   # RG ka matlab hota empty bag
  address_space       = ["10.0.0.0/16"]
}

variable "vnet-name" {}
variable "vnet-location" {}
variable "rg-name" {}