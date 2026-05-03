resource "aws_apigatewayv2_api" "main" {
  name          = "${var.env}-api"
  protocol_type = "HTTP"

  cors_configuration {
    allow_origins = ["*"]
    allow_methods = ["POST"]
    allow_headers = ["content-type"]
    max_age       = 300
  }
}
