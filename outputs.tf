# ---------------------------------------------
# Log Analytics Workspace Outputs
# ---------------------------------------------

output "workspace_id" {
  description = "Log Analytics Workspace ID"
  value = local.workspace_id
}

output "workspace_name" {
  description = "Log Analytics Workspace Name"
  value = var.create_workspace ? (
    azurerm_log_analytics_workspace.main[0].name
  ) : (
    data.azurerm_log_analytics_workspace.existing[0].name
  )
}

# ---------------------------------------------
# Application Insights Outputs
# ---------------------------------------------

output "application_insights_id" {
  description = "Application Insights Resource ID"
  value       = azurerm_application_insights.main.id
}

output "application_insights_name" {
  description = "Application Insights Name"
  value       = azurerm_application_insights.main.name
}

output "application_insights_instrumentation_key" {
  description = "Application Insights Instrumentation Key"
  value       = azurerm_application_insights.main.instrumentation_key
  sensitive   = true
}

output "application_insights_connection_string" {
  description = "Application Insights Connection String"
  value       = azurerm_application_insights.main.connection_string
  sensitive   = true
}

output "application_insights_app_id" {
  description = "Application Insights App ID"
  value       = azurerm_application_insights.main.app_id
}
