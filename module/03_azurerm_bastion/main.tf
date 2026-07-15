resource "azurerm_bastion_host" "my_bastion" {
  for_each = var.bastion
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = var.resource_group_name[each.value.rg_key]

  ip_configuration {
    name                 = each.value.ip_configuration_name
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.my_pip[each.value.pip_key].id
  }
}

resource "azurerm_public_ip" "my_pip" {
  for_each = var.azurerm_public_ip
  name                = each.value.name
  resource_group_name = var.resource_group_name[each.value.rg_key]
  location            = each.value.location
  allocation_method   = "Static"
  sku                 = "Standard"
}



