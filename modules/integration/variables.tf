variable "s3_bucket_arn" {
  description = "ARN of the existing S3 bucket"
  type        = string
}

variable "s3_bucket_id" {
  description = "ID (name) of the existing S3 bucket"
  type        = string
}

variable "sqs_queue_arn" {
  description = "ARN of the existing SQS queue"
  type        = string
}

variable "sqs_queue_url" {
  description = "URL (queue_url) of the existing SQS queue"
  type        = string
}
