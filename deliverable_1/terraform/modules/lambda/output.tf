output "lambda_function_name" {
  value = aws_lambda_function.process_data.function_name
}

output "lambda_function_arn" {
  value = aws_lambda_function.process_data.arn
}