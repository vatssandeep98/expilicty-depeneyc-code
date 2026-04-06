resource "azurerm_network_interface" "nic" {  
  depends_on = [azurerm_subnet.subnet1]
  name                = "yogi-nic"
  location            = "Central India"
  resource_group_name = "sharma"

  ip_configuration {
    name                 = "internal"
    subnet_id            = azurerm_subnet.subnet1.id   #subnet id yha refer ho rhi hai      #
    public_ip_address_id = azurerm_public_ip.publicip.id  #public ip ki id yha refer ho rahi hai
    private_ip_address_allocation = "Dynamic"
  }
}