variable "virtual_network" {
  description = "The name of the virtual network"
  type = map(object({
    rg_key        = string
    vnet_name     = string
    location      = string
    address_space = list(string)
  }))
}

variable "resource_group_name" {
  description = "Resource group will create"
  type        = map(string)

}

variable "subnet" {
  type = map(object({
    rg_key           = string
    vnet_key         = string
    subnet_name      = string
    address_prefixes = list(string)
  }))
}
