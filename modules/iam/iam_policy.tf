resource "aws_iam_policy" "sign_s3_policy" {
  name   = "sign-lambda-s3-policy"
  policy = data.aws_iam_policy_document.sign_s3_permissions.json
}

resource "aws_iam_policy" "crop_s3_policy" {
  name   = "crop-lambda-s3-policy"
  policy = data.aws_iam_policy_document.crop_s3_permissions.json
}

resource "aws_iam_policy" "crop_sqs_policy" {
  name   = "crop-lambda-sqs-policy"
  policy = data.aws_iam_policy_document.crop_sqs_permissions.json
}
