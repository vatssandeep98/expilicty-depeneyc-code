resource "azurerm_public_ip" "publicip" { #PIP banega   Ise hum connect krege
  depends_on = [ azurerm_resource_group.rg3 ]
  name                = "yogi-public-ip"
  resource_group_name = "sharma"
  location            = "Central India"
  allocation_method   = "Static"
}

