# Example input variables for the configuration.
variable "resource_group_name" {
  description = "Name of the existing resource group where resources will be created"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "app_name" {
  description = "Application name for resource naming convention"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., 'dr-prod', 'prod', 'dev', 'test')"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}

