variable "aws_region" {
  description = "AWS region"
  type        = string
}
variable "vpc_id" {
  description = "VPC for security groups"
  type        = string
}

variable "route_table_private_a_id" {
  description = "Route table for private subnet in AZ-a"
  type        = string
}

variable "route_table_private_b_id" {
  description = "Route table for private subnet in AZ-b"
  type        = string
}

variable "private_subnet_az_a_id" {
  description = "Main private subnet ID in AZ-a"
  type        = string
}

variable "private_subnet_az_b_id" {
  description = "Main private subnet ID in AZ-b"
  type        = string
}

variable "security_group_vpce_sqs_id" {
  description = "Security group for sign sqs"
  type        = string

}
