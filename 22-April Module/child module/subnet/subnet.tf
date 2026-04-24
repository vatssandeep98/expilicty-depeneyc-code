resource "azurerm_subnet" "subnet" {
  name                 = var.subnet-name
  resource_group_name  = var.rg-name
  virtual_network_name = var.vnet-name
  address_prefixes     = ["10.0.1.0/24"]
}











output "subnet_id" {
  value = azurerm_subnet.subnet.id
  
}

resource "azurerm_subnet_network_security_group_association" "example" {
subnet_id = azurerm_subnet.subnet.id
network_security_group_id = var.nsg_id

}