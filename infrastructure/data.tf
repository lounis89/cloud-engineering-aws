
data "aws_caller_identity" "current" {
}

data "template_file" "policy_sqs_json_sns_event" {
  template = file("${path.module}/roles_and_policies/sqs_policy.json.tmpl")
  vars = {
    aws_sns_topic_arn = aws_sns_topic.topic_sns.arn
    aws_sqs_queue_arn = aws_sqs_queue.sqs_queue.arn
  }
}

data "template_file" "policy_sns_json_s3_event" {
  template = file("${path.module}/roles_and_policies/sns_policy.json.tmpl")
  vars = {
    sns_topic_name = var.sns_topic_name
    bucket_arn     = aws_s3_bucket.raw.arn
    region         = var.region
    account_id     = data.aws_caller_identity.current.account_id
  }
}

data "template_file" "policy_lambda_json" {
  template = file("${path.module}/roles_and_policies/lambda_policy.json.tmpl")
  vars = {
    bucket_arn = aws_s3_bucket.raw.arn
    sqs_arn    = aws_sqs_queue.sqs_queue.arn
  }
}

data "archive_file" "zip_code_lambda" {
  type = "zip"
  output_path = "code_lambda.zip"
  source_file = "${path.module}/../lambda_code/src/main.py"
}


