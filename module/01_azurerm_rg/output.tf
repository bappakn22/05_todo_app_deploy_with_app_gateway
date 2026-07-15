output "resource_group_id" {
  value = {
    for k, v in azurerm_resource_group.my_rg : k => v.id
  }
}

output "resource_group_name" {
  value = {
    for k, v in azurerm_resource_group.my_rg : k => v.name
  }
}