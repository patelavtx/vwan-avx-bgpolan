variable "region" {
  description = "Azure Virtual WAN region"
}

variable "rg_name" {
  description = "Resource Group Name"
}

variable "vwan_name" {
  description = "Virtual WAN name"
}

variable "vwan_hub_name" {
  description = "Virtual WAN hub name"
}

variable "vwan_hub_prefix" {
  description = "Virtual WAN hub address prefix"
}

variable "avx_transit_vnet" {
  description = "Aviatrix transit VNET id"
}

variable "avx_prim_gw_ip" {
  description = "Aviatrix primary gateway IP"
}

variable "avx_ha_gw_ip" {
  description = "Aviatrix HA gateway IP"
}

variable "avx_transit_gateway_asn" {
  description = "Aviatrix transit gateway ASN"
}