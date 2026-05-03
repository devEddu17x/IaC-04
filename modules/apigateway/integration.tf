resource "aws_apigatewayv2_integration" "sign_lambda_integration" {
  api_id                 = aws_apigatewayv2_api.main.id
  integration_type       = "AWS_PROXY"
  integration_uri        = var.sign_lambda_invoke_arn
  integration_method     = "POST"
  payload_format_version = "2.0"
}
