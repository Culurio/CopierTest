# Example outputs to expose values to other stacks or pipelines.
output "example" {
  description = "Example Output"
  value       = data.azurerm_resource_group.example.id
}
