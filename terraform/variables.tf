variable "subscription_id" {
  description = "The subscription ID for the Azure provider."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "canadacentral"
}

variable "vnet_address_space" {
  description = "The address space for the virtpoual network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "aks_subnet_prefix" {
  description = "The address prefix for the AKS subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "postgres_subnet_prefix" {
  description = "The address prefix for the PostgreSQL subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "aks_node_count" {
  description = "The number of nodes in the AKS cluster."
  type        = number
  default     = 2
}

variable "min_node_count" {
  description = "The minimum number of nodes in the AKS cluster."
  type        = number
  default     = 2
}

variable "max_node_count" {
  description = "The maximum number of nodes in the AKS cluster."
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "The size of the virtual machines in the AKS cluster."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "postgres_version" {
  type    = string
  default = "17"
}

variable "postrgres_admin_username" {
  type    = string
  default = "credpayadmin"
}

variable "database_name" {
  type    = string
  default = "credpay"
}

variable "log_retention_days" {
  type    = number
  default = 7
}

variable "key_vault_name" {
  type = string
}

variable "key_vault_resource_group_name" {
  type = string
}