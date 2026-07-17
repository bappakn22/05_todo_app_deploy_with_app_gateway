resource "azurerm_public_ip" "lb-public-ip" {
  name                = var.azurerm_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "mylb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.lb-public-ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend-pool" {
  loadbalancer_id = azurerm_lb.mylb.id
  name            = var.backend_address_pool_name
}


resource "azurerm_lb_rule" "lb-rule" {
  loadbalancer_id                = azurerm_lb.mylb.id
  name                           = var.lbrule_name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 8000
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend-pool.id]
  probe_id                       = azurerm_lb_probe.h-probe.id
}

resource "azurerm_lb_probe" "h-probe" {
  loadbalancer_id = azurerm_lb.mylb.id
  name            = var.h_probe_name
  port            = 80
  protocol        = "Tcp"
}

resource "azurerm_network_interface_backend_address_pool_association" "pool-assoc" {
  depends_on = [
    azurerm_lb_backend_address_pool.backend-pool, azurerm_lb.mylb, azurerm_lb_rule.lb-rule
  ]
  for_each                = var.nic_details
  network_interface_id    = each.value.nic_id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend-pool.id
}

