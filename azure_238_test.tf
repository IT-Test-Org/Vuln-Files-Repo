resource "azurerm_cognitive_account" "openai" {
  for_each                           = var.openai_services
  name                               = each.key
  kind                               = "OpenAI"
  sku_name                           = "S0"
  resource_group_name                = azurerm_resource_group.guardian.name
  location                           = each.value.region
  local_auth_enabled                 = false
  public_network_access_enabled      = false
  outbound_network_access_restricted = true
  custom_subdomain_name              = each.key

  network_acls {
    default_action = "Deny"
  }
}
