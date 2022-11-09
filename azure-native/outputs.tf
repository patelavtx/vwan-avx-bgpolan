data "azurerm_virtual_hub" "example" {
  name                = azurerm_virtual_hub.orsted_vwan_hub.name
  resource_group_name = azurerm_resource_group.vwan_rg.name
}

output "virtual_hub_ips" {
  value = data.azurerm_virtual_hub.example.virtual_router_ips
}