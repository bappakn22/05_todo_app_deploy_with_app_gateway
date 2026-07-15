variable "rg_name" {
  description = "The name of the resource group"
  type = map(object({
    location = string
    project_name = string
    env_name = string
    instance = string
    managed_by = string
  }))

}

