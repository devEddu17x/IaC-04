data "aws_iam_policy_document" "s3_to_sqs_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
    actions   = ["sqs:SendMessage"]
    resources = [var.sqs_queue_arn]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [var.s3_bucket_arn]
    }
  }
}

resource "aws_sqs_queue_policy" "s3_to_sqs_policy" {
  queue_url = var.sqs_queue_url
  policy    = data.aws_iam_policy_document.s3_to_sqs_policy_document.json
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.s3_bucket_id

  queue {
    queue_arn     = var.sqs_queue_arn
    events        = ["s3:ObjectCreated:*"]
    filter_prefix = "uploads/"
  }

  depends_on = [aws_sqs_queue_policy.s3_to_sqs_policy]
}
