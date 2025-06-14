# Serverless API with AWS Lambda and API Gateway

This project deploys a simple serverless API using AWS Lambda and API Gateway. The API provides a greeting endpoint that returns a personalized message based on the provided name parameter.

## Project Overview

The infrastructure consists of:
- An AWS Lambda function (`ProcessData`) that processes requests and returns greeting messages
- An API Gateway that exposes the Lambda function through a REST API
- A deployment stage (`prod`) for the API Gateway

The Lambda function takes a `name` parameter and returns a greeting message: "Hello {name}, your request was processed successfully."

## Prerequisites

- AWS account with appropriate permissions
- AWS CLI configured with your credentials
- Terraform installed (version 0.12 or later)
- PowerShell (for Windows users)

## Configuration

Before deploying, you may need to modify the following variables in `terraform/variables.tf`:

1. **AWS Region** (default: `us-west-2`)
   ```hcl
   variable "region" {
     description = "AWS Region to deploy resources"
     type        = string
     default     = "us-west-2"
   }
   ```

2. **Project Name** (default: `talento-tech`)
   ```hcl
   variable "project_name" {
     description = "AWS Project Name"
     type        = string
     default     = "talento-tech"
   }
   ```

3. **Lambda Role ARN** (important: replace with your own IAM role ARN)
   ```hcl
   variable "lambda_role_arn" {
     description = "ARN of the IAM role for Lambda functions"
     type        = string
     default     = "arn:aws:iam::407496345527:role/LabRole"
   }
   ```

## Deployment Instructions

The project includes a Makefile with several commands to simplify deployment:

1. **Create the Lambda function package**:
   ```
   make pkg
   ```
   This command creates a ZIP package from the Lambda function code in the `src` directory.

2. **Initialize Terraform**:
   ```
   make init
   ```

3. **Select the environment** (optional):
   ```
   make change_development
   ```
   or
   ```
   make change_production
   ```

4. **Validate the Terraform configuration**:
   ```
   make validate
   ```

5. **Preview the changes**:
   ```
   make plan
   ```

6. **Deploy the infrastructure**:
   ```
   make apply
   ```
   When prompted, type `yes` to confirm the deployment.

## Testing the API

After deployment, Terraform will output the API Gateway URL. You can test the API using:

1. **Browser**: Navigate to the URL with a query parameter:
   ```
   https://{api-id}.execute-api.{region}.amazonaws.com/prod/greeting?name=John
   ```

2. **Curl**:
   ```
   curl "https://{api-id}.execute-api.{region}.amazonaws.com/prod/greeting?name=John"
   ```

3. **Postman**: Create a GET request to the URL with the query parameter.

The API should return a response like:
```json
"Hello John, your request was processed successfully."
```

## Cleanup

To remove all deployed resources:

```
make destroy
```

When prompted, type `yes` to confirm the deletion of resources.

## Troubleshooting

- If you encounter permission issues, ensure your AWS credentials have the necessary permissions and that the Lambda role ARN is correct.
- If the Lambda function fails to deploy, check that the package was created correctly with `make pkg`.
- For API Gateway issues, check the CloudWatch logs for the Lambda function.