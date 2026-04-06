resource "azurerm_network_security_group" "nsg" {  # NSG Banega  Port On or off krne ke liye
 depends_on = [ azurerm_resource_group.rg3 ]
  name                = "sharma-nsg"
  location            = "Central India"
  resource_group_name = "sharma"

  security_rule {
    name                       = "munibai-nsgwali"
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

