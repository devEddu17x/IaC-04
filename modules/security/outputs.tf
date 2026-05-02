output "sg_sign_lambda-id" {
  description = "Security group id from sign_lambda"
  value       = aws_security_group.sg-sign_lambda.id
}

output "sg_crop_lambda-id" {
  description = "Security group id from crop_lambda"
  value       = aws_security_group.sg-crop_lambda.id
}
