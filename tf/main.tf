resource "aws_s3_bucket" "lambda-bucket" {
  bucket = local.lambda-bucket
}

resource "aws_s3_object" "lambda-zip" {
  bucket        = aws_s3_bucket.lambda-bucket.id
  key           = var.function-name
  source        = data.archive_file.source.output_path
  etag          = filemd5(data.archive_file.source.output_path)
  force_destroy = true
}

resource "aws_lambda_function" "lambda" {
  filename      = data.archive_file.source.output_path
  function_name = var.function-name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "app.handler"
  runtime       = local.lambda-runtime

  environment {
    variables = {
      foo = "bar"
    }
  }
}

resource "aws_lambda_permission" "this" {
  statement_id  = "${var.function-name}-AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"
}

resource "aws_api_gateway_rest_api" "this" {
  name        = "${var.function-name}-APIGateway"
  description = "${var.function-name} API Gateway"
}

resource "aws_api_gateway_resource" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "this" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.this.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "this" {
  rest_api_id             = aws_api_gateway_rest_api.this.id
  resource_id             = aws_api_gateway_resource.this.id
  http_method             = aws_api_gateway_method.this.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda.invoke_arn
}

resource "aws_api_gateway_deployment" "this" {
  depends_on = [
    aws_api_gateway_integration.this,
    aws_api_gateway_method.this
  ]

  rest_api_id = aws_api_gateway_rest_api.this.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "this" {
  deployment_id = aws_api_gateway_deployment.this.id
  rest_api_id   = aws_api_gateway_rest_api.this.id
  stage_name    = var.function-stage
}

resource "aws_api_gateway_method_settings" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  stage_name  = aws_api_gateway_stage.this.stage_name
  method_path = "*/*"

  settings {
    metrics_enabled = false
  }
}
