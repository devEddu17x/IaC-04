variable "s3_bucket_images_arn" {
  description = "ARN of the S3 bucket for lambda sign urls to post images"
  type        = string
}

variable "sqs_main_queue_arn" {
  description = "ARN for main sqs queue"
  type        = string
}
