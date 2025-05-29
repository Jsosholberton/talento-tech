variable "region" {
  description = "AWS Region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "project_name" {
  description = "AWS Project Name"
  type        = string
  default     = "talento-tech"
}

variable "environment" {
  description = "Environment to deploy resources" # Description of the environment variable
  type = map(string) # Data type of the variable
  default = {
    production  = "prod"
    development = "dev"
    default     = "test"
  }
}
