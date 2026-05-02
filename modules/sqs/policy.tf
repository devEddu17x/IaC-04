resource "aws_sqs_queue_redrive_policy" "dead_letter_queue_policy" {
  queue_url = aws_sqs_queue.main_queue.id
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dead_letter_queue.arn
    maxReceiveCount     = 3
  })
}

data "aws_iam_policy_document" "s3_to_sqs_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
    actions   = ["sqs:SendMessage"]
    resources = [aws_sqs_queue.main_queue.arn]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [var.s3_bucket_images_arn]
    }
  }
}

resource "aws_sqs_queue_policy" "s3_to_sqs_policy" {
  queue_url = aws_sqs_queue.main_queue.id
  policy    = data.aws_iam_policy_document.s3_to_sqs_policy_document.json
}
