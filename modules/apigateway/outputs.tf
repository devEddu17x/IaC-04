output "api_id" {
  description = "HTTP API identifier"
  value       = aws_apigatewayv2_api.main.id
}

output "api_arn" {
  description = "HTTP API ARN"
  value       = aws_apigatewayv2_api.main.arn
}

output "api_name" {
  description = "HTTP API name"
  value       = aws_apigatewayv2_api.main.name
}

output "api_stage_name" {
  description = "API stage name"
  value       = aws_apigatewayv2_stage.stage.name
}

output "api_invoke_url" {
  description = "Base invoke URL for the deployed API stage"
  value       = aws_apigatewayv2_stage.stage.invoke_url
}

