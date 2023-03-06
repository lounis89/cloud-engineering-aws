resource "aws_sns_topic" "topic_sns" {
  name   = var.sns_topic_name
  policy = data.template_file.policy_sns_json_s3_event.rendered
}

resource "aws_sns_topic_subscription" "sns_send_event_to_sqs" {
  topic_arn = aws_sns_topic.topic_sns.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.sqs_queue.arn
}

resource "aws_sns_topic_subscription" "topic_email_subscription" {
  topic_arn = aws_sns_topic.topic_sns.arn
  protocol  = "email"
  endpoint  = var.notif_mail
}