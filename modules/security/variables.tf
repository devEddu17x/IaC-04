variable "vpc_id" {
  description = "VPC for security groups"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "env" {
  description = "Environment name (dev, qa, prod)"
  type        = string
}
