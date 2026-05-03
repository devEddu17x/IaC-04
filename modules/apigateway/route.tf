resource "aws_apigatewayv2_route" "sign_route" {
  api_id    = aws_apigatewayv2_api.main.id
  route_key = "POST /request-upload"
  target    = "integrations/${aws_apigatewayv2_integration.sign_lambda_integration.id}"
}
