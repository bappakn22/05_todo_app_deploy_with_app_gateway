module "rg" {
  source  = "../../module/01_azurerm_rg"
  rg_name = var.resource_details
}

module "vnet" {
  source              = "../../module/02_azurerm_networking"
  virtual_network     = var.vnet_details
  resource_group_name = module.rg.resource_group_name
  subnet              = var.subnet_details

}

module "bastion_host" {

  source              = "../../module/03_azurerm_bastion"
  bastion             = var.bastion_details
  subnet_id           = module.vnet.subnet["bastion-subnet"]
  resource_group_name = module.rg.resource_group_name
  azurerm_public_ip   = var.azurerm_public_ip
}

module "linux_vm" {

  source                        = "../../module/04_azurerm_vm"
  azurerm_linux_virtual_machine = var.azurerm_linux_virtual_machine
  resource_group_name           = module.rg.resource_group_name
  subnet_id                     = module.vnet.subnet
  admin_username                = data.azurerm_key_vault_secret.kv_user.value
  admin_password                = data.azurerm_key_vault_secret.kv_pass.value
}

module "nsg_security_rules" {
  source                 = "../../module/05_azurerm_nsg"
  resource_group_name    = module.rg.resource_group_name
  network_security_group = var.network_security_group
  subnet_id              = module.vnet.subnet
}

module "lb" {
  source                         = "../../module/06_azurerm_lb"
  azurerm_public_ip_name         = "load_pip"
  location                       = "central india"
  resource_group_name            = module.rg.resource_group_name["rg-01"]
  lb_name                        = "az_lb"
  frontend_ip_configuration_name = "lb-frontend-ip"
  backend_address_pool_name      = "lb-backend-pool"
  lbrule_name                    = "empirehttp-rule"
  h_probe_name                   = "empirehttp-probe"
  nic_details                    = module.linux_vm.be-nic_details
}

module "mssql" {
  source                       = "../../module/07_azurerm_sql"
  mssql                        = var.mssql_details
  resource_group_name          = module.rg.resource_group_name
  administrator_login          = data.azurerm_key_vault_secret.kv_user.value
  administrator_login_password = data.azurerm_key_vault_secret.kv_pass.value
}














