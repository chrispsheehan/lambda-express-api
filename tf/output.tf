output "api_gateway_url" {
  value = aws_api_gateway_stage.my_api_stage.invoke_url
}