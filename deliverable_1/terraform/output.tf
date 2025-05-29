output "project_name" {
  value = var.project_name
}

output "environment" {
  value = var.environment[terraform.workspace]
}

output "api_gateway_url" {
  description = "The URL of the API Gateway"
  value       = module.api_gateway.api_gateway_url
}

output "api_gateway_url_with_query" {
  description = "The URL of the API Gateway with a sample query parameter"
  value       = "${module.api_gateway.api_gateway_url}?name=John"
}
