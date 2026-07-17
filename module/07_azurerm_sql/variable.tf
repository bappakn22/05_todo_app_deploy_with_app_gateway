variable "mssql" {
  type = map(object({
    rg_key                       = string
    server_name                  = string
    location                     = string
    version                      = string
    minimum_tls_version          = string
    db_name                      = string

  }))

}

variable "resource_group_name" {
  type = map(string)
}

variable "administrator_login" {
  type = string
}
variable "administrator_login_password" {
  type = string
}