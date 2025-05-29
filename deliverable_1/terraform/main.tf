module "lambda_function" {
  source       = "./modules/lambda"
  environment  = var.environment[terraform.workspace]
  project_name = var.project_name
}

module "api_gateway" {
  source              = "./modules/api-gateway"
  environment         = var.environment[terraform.workspace]
  project_name        = var.project_name
  lambda_function_arn = module.lambda_function.lambda_function_arn
  region              = var.region
}