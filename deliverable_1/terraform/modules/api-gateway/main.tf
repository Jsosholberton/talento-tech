resource "aws_api_gateway_rest_api" "api" {
  name        = "${var.environment}-${var.project_name}-api"
  binary_media_types = ["multipart/form-data"]
  description = "${var.project_name} API Gateway for ${var.environment}"
  body = templatefile("./templates/swagger.yaml", {
    ProcessDataLambdaArn = var.lambda_function_arn
    ProjectName          = var.project_name
    Environment          = var.environment
    Region               = var.region
  })

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_api_gateway_deployment" "api" {
  rest_api_id = aws_api_gateway_rest_api.api.id

  triggers = {
    redeployment = sha256(file("./templates/swagger.yaml"))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "prod" {
  deployment_id = aws_api_gateway_deployment.api.id
  rest_api_id   = aws_api_gateway_rest_api.api.id
  stage_name    = "prod"

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
