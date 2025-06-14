# Lambda Function
resource "aws_lambda_permission" "apigw_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.process_data.function_name
  principal     = "apigateway.amazonaws.com"
}

resource "aws_lambda_function" "process_data" {
  function_name = "ProccessData"
  handler       = "lambda_function.lambda_handler"

  filename = "../dist/package.zip"
  source_code_hash = filebase64sha256("../dist/package.zip")

  runtime = "python3.12"
  role    = var.lambda_role_arn

  environment {
    variables = {}
  }

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}
