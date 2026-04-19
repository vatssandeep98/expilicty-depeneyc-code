resource "azurerm_virtual_network" "vnet1" {
 name                = "sandeep-vnet"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = ["10.0.0.0/16"]
}
