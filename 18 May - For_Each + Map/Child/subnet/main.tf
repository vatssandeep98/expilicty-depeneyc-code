resource "azurerm_subnet" "subnet" {
  for_each = var.subnet
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = ["10.0.1.0/24"]
}

variable "subnet" {}

output "subnet" {
  value = azurerm_subnet.subnet
  }

 resource "azurerm_subnet_network_security_group_association" "nsg_subnet" {
for_each = var.subnet
  subnet_id = azurerm_subnet.subnet[each.key].id
  network_security_group_id = each.value.nsg_id
}