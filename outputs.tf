output "workspace_id" {
  description = "Log Analytics Workspace ID."
  value       = local.workspace_id
}

output "application_insights_id" {
  description = "Application Insights ID."
  value       = azurerm_application_insights.main.id
}

output "application_insights_name" {
  description = "Application Insights Name."
  value       = azurerm_application_insights.main.name
}

output "application_insights_connection_string" {
  description = "Application Insights Connection String."
  value       = azurerm_application_insights.main.connection_string
  sensitive   = true
}

output "application_insights_instrumentation_key" {
  description = "Application Insights Instrumentation Key."
  value       = azurerm_application_insights.main.instrumentation_key
  sensitive   = true
}
