resource "azurerm_subnet" "subnet1" {                   # Subnet banega
depends_on = [ azurerm_virtual_network.vnet ]   
  name                 = "sandeep-subnet"
  resource_group_name  = "sharma"
  virtual_network_name = "sandeep-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}

