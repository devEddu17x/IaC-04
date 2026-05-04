variable "name_prefix" {
  description = "Prefix for the SQS queue name"
  type        = string
  default     = "eddu"
}

variable "env" {
  description = "Environment name"
  type        = string
}

