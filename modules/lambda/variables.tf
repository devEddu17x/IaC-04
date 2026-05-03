variable "env" {
  description = "Environment name"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string

}

variable "s3_images_upload_prefix" {

  description = "Upload prefix for images in S3"
  type        = string
}

variable "s3_images_processed_prefix" {

  description = "Processed image prefix for images in S3"
  type        = string
}

variable "sign_lambda_role_arn" {
  description = "ARN of the IAM sign lambda role"
  type        = string
}

variable "crop_lambda_role_arn" {
  description = "ARN of the IAM crop lambda role"
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

variable "sg_sign_lambda_id" {
  description = "Security group id from sign_lambda"
  type        = string
}

variable "sg_crop_lambda_id" {
  description = "Security group id from crop_lambda"
  type        = string
}

variable "sg_sqs_vpce_id" {
  description = "Security group id from sqs vpce"
  type        = string
}

variable "sqs_queue_arn" {
  description = "ARN of the SQS queue"
  type        = string
}
