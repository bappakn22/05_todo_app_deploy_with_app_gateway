variable "subnet_id" {
  description = "The ID of the subnet to associate with the NSG"
  type        = map(string)

}

variable "network_security_group" {
  type = map(object({
    rg_key   = string
    subnet_key = string
    nsg_name = string
    location = string
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

variable "resource_group_name" {
  type = map(string)
}
