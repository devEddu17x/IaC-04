variable "aws_region" {
  description = "AWS region"
  type        = string
}
variable "aws_availability_zone_main" {
  description = "AWS main availability zone"
  type        = string
}
variable "aws_availability_zone_replica" {
  description = "AWS replica availability zone"
  type        = string
}
variable "env" {
  description = "Environment name"
  type        = string
}
