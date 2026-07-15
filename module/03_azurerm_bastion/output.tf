output "public_ip_address_id" {
    value = {
        for k, v in azurerm_public_ip.my_pip : k => v.id
    }
}