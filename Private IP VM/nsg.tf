resource "azurerm_network_security_group" "nsg" {
  depends_on = [ azurerm_resource_group.rg ]
  name                = "motu-nsg"
  location            = "central india"
  resource_group_name = "motu-rg"

  security_rule {
    name                       = "motu-ka-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id

}
  