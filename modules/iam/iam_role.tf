resource "aws_iam_role" "sign_lambda_role" {
  name               = "sign-lambda-role-${var.env}"
  assume_role_policy = data.aws_iam_policy_document.trust_policy.json
}

resource "aws_iam_role" "crop_lambda_role" {
  name               = "crop-lambda-role-${var.env}"
  assume_role_policy = data.aws_iam_policy_document.trust_policy.json
}
