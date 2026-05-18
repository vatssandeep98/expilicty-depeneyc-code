resource "azurerm_public_ip" "pip" {
  depends_on = [ azurerm_resource_group.rg ]
  name                = "patlu-pip"
  resource_group_name = "patlu-rg"
  location            = "central india"
  allocation_method   = "Static"
}


output "pip_id" {
  value = azurerm_public_ip.pip.id
  
}