resource "azurerm_virtual_network" "my_vnet" {
  for_each            = var.virtual_network
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = var.resource_group_name[each.value.rg_key]
  address_space       = each.value.address_space
}

resource "azurerm_subnet" "my_subnet" {
  for_each             = var.subnet
  name                 = each.value.subnet_name
  resource_group_name  = var.resource_group_name[each.value.rg_key]
  virtual_network_name = azurerm_virtual_network.my_vnet[each.value.vnet_key].name
  address_prefixes     = each.value.address_prefixes

}



