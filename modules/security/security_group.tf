resource "aws_security_group" "sg-sign_lambda" {
  vpc_id = var.vpc_id
  name   = "sign_lambda_sg_${var.env}"
}
resource "aws_security_group" "sg-crop_lambda" {
  vpc_id = var.vpc_id
  name   = "crop_lambda_sg_${var.env}"
}
resource "aws_security_group" "sg-sqs_vpce" {
  vpc_id = var.vpc_id
  name   = "sqs_vpce_sg_${var.env}"
}
