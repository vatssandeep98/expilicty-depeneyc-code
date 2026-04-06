resource "azurerm_subnet_network_security_group_association" "nsg_subnet" { #ye Subnet par NSG ko attached kr rha hai
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
