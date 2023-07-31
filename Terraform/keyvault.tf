# Resource group creation

resource "azurerm_resource_group" "new-rg" {
  name     = "keyvault-rg"
  location = "eastus"
}
# Retrieve data
data "azurerm_client_config" "current" {}

# creation of keyvault
resource "azurerm_key_vault" "newkeyvault" {
  name                       = "samplekeyvault"
  location                   = "eastus"
  resource_group_name        = "keyvault-rg"
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = "cc8ddd51-545c-4b42-ae2e-09a169cfe80a"

    key_permissions = [
      "create",
      "get"
    ]
    secret_permissions = [
      "get",
      "set",
      "delete",
      "purge",
      "recover"
    ]
  }
}

# create keyvault secrets
resource "azurerm_key_vault_secret" "newsecret" {
  name         = "newkeyvaultsecret"
  value        = "mysecret"
  key_vault_id = azurerm_key_vault.newkeyvault.id

}