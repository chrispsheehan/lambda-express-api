output "api_gateway_url" {
  value = "curl -X GET ${aws_api_gateway_deployment.example.invoke_url}${aws_api_gateway_stage.example.stage_name}/hello"
}