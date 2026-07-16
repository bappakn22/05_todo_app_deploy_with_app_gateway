variable "resource_details" {
  description = "The name of the resource group"
  type = map(object({
    location     = string
    project_name = string
    env_name     = string
    instance     = string
    managed_by   = string
  }))

}

variable "vnet_details" {
  description = "The name of the virtual network"
  type = map(object({
    rg_key        = string
    vnet_name     = string
    location      = string
    address_space = list(string)
  }))
}

variable "subnet_details" {
  type = map(object({
    rg_key           = string
    vnet_key         = string
    subnet_name      = string
    address_prefixes = list(string)
  }))
}

variable "bastion_details" {
  type = map(object({
    rg_key                = string
    pip_key               = string
    bastion_name          = string
    location              = string
    ip_configuration_name = string
  }))
}

variable "azurerm_public_ip" {
  description = "The name of the public IP"
  type = map(object({
    rg_key   = string
    name     = string
    location = string
  }))
}

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

variable "network_security_group" {
  type = map(object({
    rg_key     = string
    subnet_key = string
    nsg_name   = string
    location   = string
    security_rule = list(object({
      security_rule_name         = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))

}

