variable "resource_group_name" {
  description = "Resource Group Name."
  type        = string
}

variable "app_name" {
  description = "Application Name."
  type        = string
}

variable "short_env" {
  description = "Environment Short Name."
  type        = string
}

variable "application_type" {
  description = "Application Insights Application Type."
  type        = string
  default     = "web"
}

variable "workspace_sku" {
  description = "Log Analytics Workspace SKU."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Retention period in days."
  type        = number
  default     = 30
}

variable "daily_quota_gb" {
  description = "Daily data ingestion quota."
  type        = number
  default     = -1
}

variable "create_workspace" {
  description = "Create a new Log Analytics Workspace."
  type        = bool
  default     = true
}

variable "existing_workspace_name" {
  description = "Existing Log Analytics Workspace Name."
  type        = string
  default     = null
}

variable "existing_workspace_rg" {
  description = "Existing Log Analytics Workspace Resource Group."
  type        = string
  default     = null
}
