resource "azurerm_virtual_network" "vnet" {
  depends_on = [ azurerm_resource_group.rg ]
  name                = "patlu-vnet"
  location            = "central india"
  resource_group_name = "patlu-rg"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  depends_on = [ azurerm_virtual_network.vnet ]
  name                 = "patlu-subnet"
  resource_group_name  = "patlu-rg"
  virtual_network_name = "patlu-vnet"
  address_prefixes     = ["10.0.1.0/24"]
 }
 
output "subnet_id" {
  value = azurerm_subnet.subnet.id
  }




resource "azurerm_virtual_network_peering" "vnet-1" {
  name                      = "patlu-to-motu"
  resource_group_name       = "patlu-rg"
  virtual_network_name      = "patlu-vnet"
 remote_virtual_network_id = "/subscriptions/db443927-390d-4e00-aac6-f5fa50dd047f/resourceGroups/motu-rg/providers/Microsoft.Network/virtualNetworks/motu-vnet"
}

resource "azurerm_virtual_network_peering" "vnet-2" {
  name                      = "moto-to-patlu"
  resource_group_name       = "motu-rg"
  virtual_network_name      = "motu-vnet"
  remote_virtual_network_id = "/subscriptions/db443927-390d-4e00-aac6-f5fa50dd047f/resourceGroups/patlu-rg/providers/Microsoft.Network/virtualNetworks/patlu-vnet"
}