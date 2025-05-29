# Roles

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Lambda Function

resource "aws_lambda_function" "process_data" {
  function_name = "ProcesarDatos"
  handler       = "lambda_function.lambda_handler"

  filename = "../dist/${var.project_name}.zip"
  source_code_hash = filebase64sha256("../dist/${var.project_name}.zip")

  runtime = "python3.12"
  role    = aws_iam_role.lambda_exec.arn

  environment {
    variables = {}
  }

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}
