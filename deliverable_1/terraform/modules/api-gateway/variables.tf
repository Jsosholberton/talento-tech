variable "environment" {
  description = "Environment to deploy resources"
  type        = string
}

variable "project_name" {
  description = "AWS Project Name"
  type        = string
}

variable "lambda_function_arn" {
  description = "ARN of the Lambda function to process data"
  type        = string
}

variable "region" {
  description = "AWS Region to deploy resources"
  type        = string
}