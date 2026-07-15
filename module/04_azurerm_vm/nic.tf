resource "azurerm_network_interface" "my_nic" {
  for_each = var.azurerm_linux_virtual_machine
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = var.resource_group_name[each.value.rg_key]

  ip_configuration {
    name                          = each.value.nic_ip_configuration_name
    subnet_id                     = var.subnet_id[each.value.subnet_key]
    private_ip_address_allocation = "Dynamic"
  }
}

# output "nic_id" {
#   value = azurerm_network_interface.my_nic.id
# }

# output "nic_ip_config_name" {
#   description = "The name of the NIC's IP configuration"
#   value       = azurerm_network_interface.my_nic.ip_configuration[0].name
# }