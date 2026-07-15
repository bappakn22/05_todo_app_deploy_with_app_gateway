# output "subnet_name" {
#     value = {
#         for k, v in azurerm_subnet.my_subnet : k => v.name
#     }
# }

output "subnet" {
    value = {
        for k, v in azurerm_subnet.my_subnet : k => v.id
    }
}