resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet-name
  location            = "east us"
  resource_group_name = var.rg-name   # RG ka matlab hota empty bag
  address_space       = ["10.0.0.0/16"]
}

