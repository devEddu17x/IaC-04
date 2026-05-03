variable "env" {
  description = "Environment name"
  type        = string
}

variable "sign_lambda_invoke_arn" {
  description = "Invoke ARN of the sign lambda function"
  type        = string
}

variable "sign_lambda_name" {
  description = "Name of the sign lambda function"
  type        = string
}
