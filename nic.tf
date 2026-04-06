resource "azurerm_network_interface" "nic" {  
  name                = "yogi-nic"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {
    name                 = "internal"
    subnet_id            = azurerm_subnet.subnet1.id   #subnet id yha refer ho rhi hai      #
    public_ip_address_id = azurerm_public_ip.publicip.id  #public ip ki id yha refer ho rahi hai
    private_ip_address_allocation = "Dynamic"
  }
}