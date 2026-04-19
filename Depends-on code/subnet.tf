resource "azurerm_subnet" "subnet1" {                   # Subnet banega
  name                 = "sandeep-subnet"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.1.0/24"]
}

