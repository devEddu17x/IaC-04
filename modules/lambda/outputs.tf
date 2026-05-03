output "sign_lambda_arn" {
  description = "ARN of the sign lambda function"
  value       = aws_lambda_function.sign_lambda.arn
}

output "sign_lambda_name" {
  description = "Name of the sign lambda function"
  value       = aws_lambda_function.sign_lambda.function_name
}


output "sign_lambda_invoke_arn" {
  description = "Invoke ARN of the sign lambda function"
  value       = aws_lambda_function.sign_lambda.invoke_arn
}

