resource "azurerm_linux_virtual_machine" "my_vm" {
  for_each = var.azurerm_linux_virtual_machine
  name                = each.value.vm_name
  resource_group_name = var.resource_group_name[each.value.rg_key]
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = each.value.admin_username
  network_interface_ids = [
    azurerm_network_interface.my_nic[each.key].id,
  ]
  admin_password = each.value.admin_password
  disable_password_authentication = false

  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
  EOF
  )

}
