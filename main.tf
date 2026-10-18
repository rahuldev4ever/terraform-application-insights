# ---------------------------------------------
# Data section to get Resource Group details
# ---------------------------------------------
data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

# ---------------------------------------------
# Local Values
# ---------------------------------------------
locals {
  workspace_name            = "ws-${var.app_name}-${var.short_env}"
  application_insights_name = "appi-${var.app_name}-${var.short_env}"
}

# ---------------------------------------------
# Create LAW (optional)
# ---------------------------------------------
resource "azurerm_log_analytics_workspace" "main" {
  count = var.create_workspace ? 1 : 0

  name                = local.workspace_name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = var.resource_group_name

  sku               = var.workspace_sku
  retention_in_days = var.retention_in_days
  daily_quota_gb    = var.daily_quota_gb

  lifecycle {
    ignore_changes = [tags]
  }
}

# ---------------------------------------------
# Existing LAW
# ---------------------------------------------
data "azurerm_log_analytics_workspace" "existing" {
  count = var.create_workspace ? 0 : 1

  name                = var.existing_workspace_name
  resource_group_name = var.existing_workspace_rg
}

# ---------------------------------------------
# Select LAW ID
# ---------------------------------------------
locals {
  workspace_id = var.create_workspace ? (
    azurerm_log_analytics_workspace.main[0].id
  ) : (
    data.azurerm_log_analytics_workspace.existing[0].id
  )
}

# ---------------------------------------------
# Application Insights
# ---------------------------------------------
resource "azurerm_application_insights" "main" {
  name                = local.application_insights_name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = var.resource_group_name

  application_type = var.application_type
  workspace_id     = local.workspace_id

  lifecycle {
    ignore_changes = [tags]
  }
}

# ---------------------------------------------
# Everllence Tags - LAW
# ---------------------------------------------
#resource "everllence_tag" "law_tag" {
 # count = var.create_workspace ? 1 : 0

 # provider = everllence

 # resource_ids = [
  #  azurerm_log_analytics_workspace.main[0].id
  #]

 # tags = {
   # createdBy = "terraform"
 #}
#}

# ---------------------------------------------
# Everllence Tags - Application Insights
# ---------------------------------------------
#resource "everllence_tag" "appi_tag" {
 # provider = everllence

#  resource_ids = [
 #   azurerm_application_insights.main.id
 # ]

 # tags = {
  #  createdBy = "terraform"
  #}
#}
