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

variable "transit_cidr" {
  description = "transit CIDR address prefix"
}

variable "ctrl_azure_acc" {
  description = "Azure account name in the controller"
}

variable "avx_transit_gateway_asn" {
  description = "Aviatrix transit gateway ASN"
}

locals {
  split_data      = split("/", values(data.azurerm_virtual_network.example.vnet_peerings)[0])
  subscription_id = local.split_data[2]
  resource_group  = local.split_data[4]
  vnet_name       = local.split_data[8]
}

variable "bgp_remote_as_num" {
  description = "vWAN BGP ASN"
}

variable "backup_bgp_remote_as_num" {
  description = "vWAN BGP ASN"
}

variable "vwan_avx_connection_name" {
  description = "vWAN to Avx connection name"
}


variable "avtx_controllerip" {
  type = string
  default = "4.234.106.246"
}

variable "avtx_admin_user" {
  type = string
  default = "admin"
} 

variable "avtx_admin_password" {
  type = string
  default = "Aviatrix123#"
}
