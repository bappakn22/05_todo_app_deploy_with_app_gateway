resource "azurerm_resource_group" "my_rg" {
  for_each = var.rg_name
  name     = "rg-${each.value.project_name}-${each.value.env_name}-${each.value.instance}"
  location = each.value.location
  managed_by = local.managed_by
  tags = merge(local.common_tags,{
    managed_by = each.value.managed_by}
    )
}