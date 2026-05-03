output "api_invoke_url" {
  description = "Base invoke URL for the deployed API stage"
  value       = module.apigateway.api_invoke_url
}

