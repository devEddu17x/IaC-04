resource "aws_lambda_event_source_mapping" "sqs_to_crop_lambda" {
  event_source_arn = var.sqs_queue_arn
  function_name    = aws_lambda_function.crop_lambda.arn
  batch_size       = 10
  enabled          = true
}
