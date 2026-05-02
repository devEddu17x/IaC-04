resource "aws_sqs_queue" "main_queue" {
  name                       = "${var.name_prefix}-image-processor-${var.env}-image-queue"
  visibility_timeout_seconds = 360
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 20
}

resource "aws_sqs_queue" "dead_letter_queue" {
  name                      = "${var.name_prefix}-image-processor-${var.env}-image-dlq"
  message_retention_seconds = 1209600
}

