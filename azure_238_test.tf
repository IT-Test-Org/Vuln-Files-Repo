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
  tags = {
    git_commit           = "1a5748c4b2e537e565c4c217e5f258e8b310850a"
    git_file             = "azure_238_test.tf"
    git_last_modified_at = "2024-08-28 00:48:25"
    git_last_modified_by = "imtariq@shockers.wichita.edu"
    git_modifiers        = "imtariq"
    git_org              = "IT-Test-Org"
    git_repo             = "Vuln-Files-Repo"
    yor_name             = "openai"
    yor_trace            = "098e34de-4ceb-4b21-9dd8-88e01f95b758"
  }
}
