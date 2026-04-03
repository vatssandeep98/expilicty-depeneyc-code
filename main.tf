terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.66.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "ce5f86d2-b2e0-4edf-b803-7374190f47f5"
}


resource "azurerm_resource_group" "rg" { # RG banega
  name     = "sharma-rg"
  location = "Central India"
}

resource "azurerm_resource_group" "rg1" { # RG banega
  name     = "yogi-rg"
  location = "Central India"
}

resource "azurerm_virtual_network" "vnet" {
  depends_on = [ azurerm_resource_group.rg1 ]
  name                = "sandeep-vnet"
  location            = "central india"
  resource_group_name = "sharma"
  address_space       = ["10.0.0.0/16"]
}


resource "azurerm_subnet" "subnet1" {                   # Subnet banega
depends_on = [ azurerm_virtual_network.vnet ]   
  name                 = "sandeep-subnet"
  resource_group_name  = "sharma"
  virtual_network_name = "sandeep-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}

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

resource "azurerm_subnet_network_security_group_association" "nsg_subnet" { #ye Subnet par NSG ko attached kr rha hai
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_public_ip" "publicip" { #PIP banega   Ise hum connect krege
  depends_on = [ azurerm_resource_group.rg3 ]
  name                = "yogi-public-ip"
  resource_group_name = "sharma"
  location            = "Central India"
  allocation_method   = "Static"
}

resource "azurerm_virtual_machine" "vm" {
  depends_on            = [azurerm_network_interface.nic]
  name                  = "samrat-vm"
  location              = "Central India"
  resource_group_name   = "sharma"
  network_interface_ids = [azurerm_network_interface.nic.id]  #yha par NIC ID refer ho rahi hai
   vm_size = "Standard_B2as_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "samrat-vm"
    admin_username = "samrat"
    admin_password = "Samrat@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

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

mera naam sandeep hai mai sachin or yogi kaa frnd hu
heelo dosot