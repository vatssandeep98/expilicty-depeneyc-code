resource "azurerm_public_ip" "publicip" { #PIP banega   Ise hum connect krege
  name                = "sandeep-public-ip"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  allocation_method   = "Static"
}

