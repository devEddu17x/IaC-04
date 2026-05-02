variable "aws_region" {
  description = "AWS region"
  type        = string
}
variable "aws_profile" {
  description = "AWS profile"
  type        = string
}
variable "name_prefix" {
  description = "Prefix for unique aws resource names"
  type        = string
  default     = "eddu"
}
variable "aws_availability_zone_main" {
  description = "AWS main availability zone"
  type        = string
}
variable "aws_availability_zone_replica" {
  description = "AWS replica availability zone"
  type        = string
}
