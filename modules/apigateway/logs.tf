resource "aws_cloudwatch_log_group" "api_logs" {
  name              = "/aws/apigateway/image-processor-api-${var.env}"
  retention_in_days = 14
}
