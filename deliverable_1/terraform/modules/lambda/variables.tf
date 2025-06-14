variable "environment" {
  description = "Environment to deploy resources"
  type        = string
}

variable "project_name" {
  description = "AWS Project Name"
  type        = string
}

variable "lambda_role_arn" {
  description = "ARN of the IAM role for Lambda functions"
  type        = string
}