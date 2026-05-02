variable "name_prefix" {
  description = "Prefix for the SQS queue name"
  type        = string
  default     = "eddu"
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "s3_bucket_images_arn" {
  description = "ARN of the S3 bucket for images"
  type        = string
}
