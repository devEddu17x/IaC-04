resource "aws_cloudwatch_log_group" "sign_lambda_logs" {
  name              = "/aws/lambda/sign-lambda-${var.env}"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "crop_lambda_logs" {
  name              = "/aws/lambda/crop-lambda-${var.env}"
  retention_in_days = 14
}
