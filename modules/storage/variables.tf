variable "name_prefix" {
  description = "Prefix for the SQS queue name"
  type        = string
  default     = "eddu"
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "sqs_main_queue_arn" {
  description = "ARN for main sqs queue"
  type        = string
}
