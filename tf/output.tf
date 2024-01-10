output "api_gateway_url" {
  value = "${aws_api_gateway_deployment.this.invoke_url}${aws_api_gateway_stage.this.stage_name}"
}

output "function_name" {
  value = aws_lambda_function.lambda.function_name
}
