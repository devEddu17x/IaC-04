output "sqs_main_queue_name" {
  description = "Name for main sqs queue"
  value       = aws_sqs_queue.main_queue.name
}

output "sqs_dead_letter_queue_name" {
  description = "Name for dead letter sqs queue"
  value       = aws_sqs_queue.dead_letter_queue.name
}

output "sqs_main_queue_arn" {
  description = "ARN for main sqs queue"
  value       = aws_sqs_queue.main_queue.arn
}

output "sqs_dead_letter_queue_arn" {
  description = "ARN for dead letter sqs queue"
  value       = aws_sqs_queue.dead_letter_queue.arn
}
