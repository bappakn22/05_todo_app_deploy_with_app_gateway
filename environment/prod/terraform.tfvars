resource_details = {
  "rg-01" = {
    location     = "central india"
    project_name = "cloud"
    env_name     = "prod"
    instance     = "01"
    managed_by   = "prod-cloud"
  }
}

vnet_details = {
  "vnet_1" = {
    rg_key        = "rg-01"
    vnet_name     = "cloud_vnet"
    location      = "central india"
    address_space = ["10.0.0.0/16"]

  }
}

subnet_details = {
  "frontend-subnet" = {
    rg_key           = "rg-01"
    vnet_key         = "vnet_1"
    subnet_name      = "fe-snet"
    address_prefixes = ["10.0.1.0/24"]
  }

  "backend-subnet" = {
    rg_key           = "rg-01"
    vnet_key         = "vnet_1"
    subnet_name      = "be-snet"
    address_prefixes = ["10.0.2.0/24"]
  }

  "bastion-subnet" = {
    rg_key           = "rg-01"
    vnet_key         = "vnet_1"
    subnet_name      = "AzureBastionSubnet"
    address_prefixes = ["10.0.3.0/26"]
  }

  "appgateway" = {
    rg_key           = "rg-01"
    vnet_key         = "vnet_1"
    subnet_name      = "appgateway-snet"
    address_prefixes = ["10.0.4.0/24"]
  }
}

bastion_details = {
  "bastion_host" = {
    rg_key                = "rg-01"
    pip_key               = "pip1"
    bastion_name          = "azbastion"
    location              = "central india"
    ip_configuration_name = "bastion_ip"
  }
}

azurerm_public_ip = {
  "pip1" = {
    rg_key   = "rg-01"
    name     = "bastion_pip"
    location = "central india"
  }
}

azurerm_linux_virtual_machine = {
  "frontend_vm1" = {
    vm_role                   = "frontend"
    rg_key                    = "rg-01"
    subnet_key                = "frontend-subnet"
    vm_name                   = "empire-frontendvm1"
    location                  = "central india"
    vm_size                   = "Standard_D2s_v3"
    admin_username            = "devopsadmin"
    admin_password            = "devops@12345"
    nic_name                  = "nic_fevm1"
    nic_ip_configuration_name = "nic_ip_config_fevm1"
  }

  # "frontend_vm2" = {
  #   rg_key                    = "rg-01"
  #   subnet_key                =  "frontend-subnet"
  #   vm_name                   = "empire-frontendvm2"
  #   location                  = "central india"
  #   vm_size                   = "Standard_D2s_v3"
  #   admin_username            = "devopsadmin"
  #   admin_password            = "devops@12345"
  #   nic_name                  = "nic_fevm2"
  #   nic_ip_configuration_name = "nic_ip_config_fevm2"
  # }

  "backend_vm1" = {
    vm_role                   = "backend"
    rg_key                    = "rg-01"
    subnet_key                = "backend-subnet"
    vm_name                   = "empire-backendvm1"
    location                  = "central india"
    vm_size                   = "Standard_D2s_v3"
    admin_username            = "devopsadmin"
    admin_password            = "devops@12345"
    nic_name                  = "nic_bevm1"
    nic_ip_configuration_name = "nic_ip_config_bevm1"
  }

  "backend_vm2" = {
    vm_role                   = "backend"
    rg_key                    = "rg-01"
    subnet_key                = "backend-subnet"
    vm_name                   = "empire-backendvm2"
    location                  = "central india"
    vm_size                   = "Standard_D2s_v3"
    admin_username            = "devopsadmin"
    admin_password            = "devops@12345"
    nic_name                  = "nic_bevm2"
    nic_ip_configuration_name = "nic_ip_config_bevm2"
  }
}

network_security_group = {
  "fe-nsg" = {
    rg_key     = "rg-01"
    subnet_key = "frontend-subnet"
    nsg_name   = "frontend-nsg"
    location   = "central india"
    security_rule = [
      {
        security_rule_name         = "allowednsgsr1"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }

  "be-nsg" = {
    rg_key     = "rg-01"
    subnet_key = "backend-subnet"
    nsg_name   = "backend-nsg"
    location   = "central india"
    security_rule = [
      {
        security_rule_name         = "allowednsgsr2"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}
