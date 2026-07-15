variable "bastion" {
  type = map(object({
    rg_key                = string
    pip_key = string
    bastion_name          = string
    location              = string
    ip_configuration_name = string
  }))
}

variable "resource_group_name" {
  type = map(string)
}

variable "subnet_id" {
  type = string
}

variable "azurerm_public_ip" {
  description = "The name of the public IP"
  type        = map(object({
    rg_key = string
    name = string
    location = string
  }))
}