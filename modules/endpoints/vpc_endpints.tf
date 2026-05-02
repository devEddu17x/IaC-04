resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [var.route_table_private_a_id, var.route_table_private_b_id]
}

resource "aws_vpc_endpoint" "sqs_interface" {
  vpc_id             = var.vpc_id
  service_name       = "com.amazonaws.${var.aws_region}.sqs"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [var.private_subnet_az_a_id, var.private_subnet_az_b_id]
  security_group_ids = [var.security_group_vpce_sqs_id]
}
