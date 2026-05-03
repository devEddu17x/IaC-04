resource "aws_iam_role_policy_attachment" "sign_custom_s3_attach" {
  role       = aws_iam_role.sign_lambda_role.name
  policy_arn = aws_iam_policy.sign_s3_policy.arn
}

resource "aws_iam_role_policy_attachment" "sign_logs_attach" {
  role       = aws_iam_role.sign_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "sign_vpc_attach" {
  role       = aws_iam_role.sign_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role_policy_attachment" "crop_logs_attach" {
  role       = aws_iam_role.crop_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "crop_vpc_attach" {
  role       = aws_iam_role.crop_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role_policy_attachment" "crop_s3_attach" {
  role       = aws_iam_role.crop_lambda_role.name
  policy_arn = aws_iam_policy.crop_s3_policy.arn

}
resource "aws_iam_role_policy_attachment" "crop_sqs_attach" {
  role       = aws_iam_role.crop_lambda_role.name
  policy_arn = aws_iam_policy.crop_sqs_policy.arn
}
