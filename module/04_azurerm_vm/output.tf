output "nic_details" {
  value = {
    for k, v in azurerm_network_interface.my_nic : k => { 
      nic_id = v.id 
      ip_configuration_name = v.ip_configuration[0].name
    }
  }
}

output "fe-nic_details" {
  value = {
    for k, v in azurerm_network_interface.my_nic : k => { 
      nic_id = v.id 
      ip_configuration_name = v.ip_configuration[0].name
    }
    if startswith(k, "frontend")
  }
}

output "be-nic_details" {
  value = {
    for k, v in azurerm_network_interface.my_nic : k => { 
      nic_id = v.id 
      ip_configuration_name = v.ip_configuration[0].name
    }
    if startswith(k, "backend")
  }
}



