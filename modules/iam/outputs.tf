output "sign_lambda_role_arn" {
  description = "ARN of the IAM sign lambda role"
  value       = aws_iam_role.sign_lambda_role.arn
}

output "crop_lambda_role_arn" {
  description = "ARN of the IAM crop lambda role"
  value       = aws_iam_role.crop_lambda_role.arn
}
