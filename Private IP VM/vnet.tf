resource "azurerm_virtual_network" "vnet" {
  depends_on = [ azurerm_resource_group.rg ]
  name                = "motu-vnet"
  location            = "central india"
  resource_group_name = "motu-rg"
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  depends_on = [ azurerm_virtual_network.vnet ]
  name                 = "motu-subnet"
  resource_group_name  = "motu-rg"
  virtual_network_name = "motu-vnet"
  address_prefixes     = ["10.1.1.0/24"]
 }
 
output "subnet_id" {
  value = azurerm_subnet.subnet.id
  }


