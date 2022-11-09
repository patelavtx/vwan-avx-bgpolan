module "azure_native" {
  source                  = "./azure-native"
  rg_name                 = var.rg_name
  region                  = var.region
  vwan_name               = var.vwan_name
  vwan_hub_name           = var.vwan_hub_name
  vwan_hub_prefix         = var.vwan_hub_prefix
  avx_transit_gateway_asn = var.avx_transit_gateway_asn
  avx_prim_gw_ip          = module.azure_transit.transit_gateway.bgp_lan_ip_list[0]
  avx_ha_gw_ip            = module.azure_transit.transit_gateway.ha_bgp_lan_ip_list[0]
  avx_transit_vnet        = module.azure_transit.vpc.azure_vnet_resource_id
  depends_on = [
    module.azure_transit
  ]
}

module "azure_transit" {
  source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version = "2.3.1"

  cloud                    = "azure"
  region                   = var.region
  cidr                     = var.transit_cidr
  account                  = var.ctrl_azure_acc
  local_as_number          = var.avx_transit_gateway_asn
  insane_mode              = true
  bgp_lan_interfaces_count = 3
  enable_bgp_over_lan      = true
  enable_transit_firenet   = false
}

# module "firenet_1" {
#   source  = "terraform-aviatrix-modules/mc-firenet/aviatrix"
#   version = "v1.2.0"

#   transit_module = module.azure_transit
#   firewall_image = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1"
# }


resource "aviatrix_transit_external_device_conn" "vwan_to_avx" {
  vpc_id                    = module.azure_transit.vpc.vpc_id
  connection_name           = var.vwan_avx_connection_name
  gw_name                   = module.azure_transit.transit_gateway.gw_name
  connection_type           = "bgp"
  tunnel_protocol           = "LAN"
  remote_vpc_name           = format("%s:%s:%s", local.vnet_name, local.resource_group, local.subscription_id)
  ha_enabled                = true
  bgp_local_as_num          = module.azure_transit.transit_gateway.local_as_number
  bgp_remote_as_num         = var.bgp_remote_as_num
  backup_bgp_remote_as_num  = var.backup_bgp_remote_as_num
  remote_lan_ip             = tolist(module.azure_native.virtual_hub_ips)[0]
  backup_remote_lan_ip      = tolist(module.azure_native.virtual_hub_ips)[1]
  enable_bgp_lan_activemesh = true
}


