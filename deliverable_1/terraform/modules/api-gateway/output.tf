output "api_execution_arn" {
  description = "The ARN of the API Gateway execution"
  value       = aws_api_gateway_rest_api.api.execution_arn
}

output "api_gateway_url" {
  description = "The URL of the API Gateway"
  value       = "https://${aws_api_gateway_rest_api.api.id}.execute-api.${var.region}.amazonaws.com/prod/greeting"
}
