resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet-name
  address_space       = var.address_space
  location            = var.vnet-location
  resource_group_name = var.rg-name
}

variable "vnet-name" {}
variable "vnet-location" {}
variable "rg-name" {}
variable "address_space" {}