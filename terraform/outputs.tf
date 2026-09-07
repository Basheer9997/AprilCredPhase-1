output "resource_group_name" {
  value = module.resource_group.name
}

output "vnet_id" {
  value = module.networking.vnet_id
}

output "aks_cluster_name" {
  value = module.aks.cluster_name
}

output "aks_resource_group" {
  value = module.resource_group.name
}

output "aks_kubelet_identity_object_id" {
  value = module.aks.kubelet_identity_object_id
}

output "aks_oidc_issuer_url" {
  value = module.aks.oidc_issuer_url
}

output "aks_node_resource_group" {
  value = module.aks.node_resource_group
}

output "postgres_server_name" {
  value = module.postgres.server_name
}

output "postgres_fqdn" {
  value = module.postgres.fqdn
}

output "postgres_database_name" {
  value = module.postgres.database_name
}

output "postgres_admin_username" {
  value = module.postgres.admin_username
}

output "postgres_admin_password" {
  value     = module.postgres.admin_password
  sensitive = true
}

output "log_analytics_workspace_id" {
  value = module.monitoring.workspace_id
}

output "key_vault_name" {
  value = module.keyvault.key_vault_name
}