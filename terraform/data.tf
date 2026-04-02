# Example data sources used to look up existing infrastructure.
data "azurerm_client_config" "current" {}

# Example lookup of a resource group by name.
data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}
