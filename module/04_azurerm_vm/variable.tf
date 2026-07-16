variable "azurerm_linux_virtual_machine" {
  type = map(object({
    vm_role                   = string
    rg_key                    = string
    subnet_key                = string
    vm_name                   = string
    location                  = string
    vm_size                   = string
    admin_username            = string
    admin_password            = string
    nic_name                  = string
    nic_ip_configuration_name = string
  }))
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = map(string)
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = map(string)

}
