output "sg_sign_lambda_id" {
  description = "Security group id from sign_lambda"
  value       = aws_security_group.sg_sign_lambda.id
}

output "sg_crop_lambda_id" {
  description = "Security group id from crop_lambda"
  value       = aws_security_group.sg_crop_lambda.id
}

output "sg_sqs_vpce_id" {
  description = "Security group id from sqs vpce"
  value       = aws_security_group.sg_sqs_vpce.id
}
