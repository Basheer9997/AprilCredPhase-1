locals {
  name_prefix = "credpays1"
  tags = {
    project    = "credpay"
    managed-by = "terraform"
  }
}

module "resource_group" {
  source   = "./modules/resource-group"
  name     = "rg-${local.name_prefix}"
  location = var.location
  tags     = local.tags
}

module "networking" {
  source                 = "./modules/networking"
  name_prefix            = local.name_prefix
  resource_group_name    = module.resource_group.name
  location               = module.resource_group.location
  tags                   = local.tags
  vnet_address_space     = var.vnet_address_space
  postgres_subnet_prefix = var.postgres_subnet_prefix
  aks_subnet_prefix      = var.aks_subnet_prefix
}

module "monitoring" {
  source              = "./modules/monitoring"
  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  retention_days      = var.log_retention_days
  tags                = local.tags
}

module "postgres" {
  source              = "./modules/postgres"
  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  database_name       = var.database_name
  admin_username      = var.postrgres_admin_username
  postgres_version    = var.postgres_version
  tags                = local.tags
}

module "aks" {
  source                     = "./modules/aks"
  name_prefix                = local.name_prefix
  resource_group_name        = module.resource_group.name
  location                   = module.resource_group.location
  node_count                 = var.aks_node_count
  min_node_count             = var.min_node_count
  max_node_count             = var.max_node_count
  aks_subnet_id              = module.networking.subnet_ids["aks"]
  vm_size                    = var.vm_size
  log_analytics_workspace_id = module.monitoring.workspace_id
  tags                       = local.tags
}

module "keyvault" {
  source                        = "./modules/keyvault"
  key_vault_name                = var.key_vault_name
  key_vault_resource_group_name = var.key_vault_resource_group_name
  postgres_fqdn                 = module.postgres.fqdn
  postgres_database_name        = module.postgres.database_name
  postrgres_admin_username      = module.postgres.admin_username
  postgres_admin_password       = module.postgres.admin_password
}