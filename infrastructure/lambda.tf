resource "aws_iam_role" "iam_for_lambda" {
  name = "iam.role.lambda"

  assume_role_policy = file("${path.module}/roles_and_policies/role.tpl")
}

resource "aws_iam_policy" "lambda_policy" {
  name   = "lambda_data_processing_policy"
  policy = data.template_file.policy_lambda_json.rendered
}

resource "aws_iam_policy_attachment" "attach_lambda_policy" {
  name       = "lambda_attached_policy"
  policy_arn = aws_iam_policy.lambda_policy.arn
  roles      = [aws_iam_role.iam_for_lambda.name]
}

resource "aws_lambda_function" "lambda" {
  function_name = "lambda_processing"
  filename      = data.archive_file.zip_code_lambda.output_path
  role          = aws_iam_role.iam_for_lambda.arn
  description   = "This lambda function processes files and puts them into a bucket."
  handler       = "main.handler"
  runtime       = "python3.9"
  timeout       = 300
}