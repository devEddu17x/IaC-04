resource "aws_security_group_rule" "sqs_inbound_sign_lambda" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg-sqs_vpce.id
  source_security_group_id = aws_security_group.sg-sign_lambda.id
}

resource "aws_security_group_rule" "sqs_inbound_crop_lambda" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg-sqs_vpce.id
  source_security_group_id = aws_security_group.sg-crop_lambda.id
}

resource "aws_security_group_rule" "sign_lambda_outbound" {
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg-sign_lambda.id
  source_security_group_id = aws_security_group.sg-sqs_vpce.id
}

resource "aws_security_group_rule" "crop_lambda_outbound" {
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg-crop_lambda.id
  source_security_group_id = aws_security_group.sg-sqs_vpce.id
}
