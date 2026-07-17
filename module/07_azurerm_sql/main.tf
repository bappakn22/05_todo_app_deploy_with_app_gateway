resource "azurerm_mssql_server" "sql_server" {
  for_each                     = var.mssql
  name                         = each.value.server_name
  resource_group_name          = var.resource_group_name[each.value.rg_key]
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version

  tags = {
    environment = "production"
  }
}

resource "azurerm_mssql_database" "sql_db" {
  for_each     = var.mssql
  name         = each.value.db_name
  server_id    = azurerm_mssql_server.sql_server[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    foo = "bar"
  }
}

