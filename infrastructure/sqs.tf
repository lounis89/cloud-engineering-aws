resource "aws_sqs_queue" "sqs_queue" {
  name                      = "sqs-lob-serverless"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dead_letters_queue.arn
    maxReceiveCount     = 1
  })

  tags = {
    Environment = "dev"
  }
}

resource "aws_sqs_queue" "dead_letters_queue" {
  name                      = "dead-letters-queue-lob"
  receive_wait_time_seconds = 20
}
resource "aws_sqs_queue_policy" "queue_policy" {
  queue_url = aws_sqs_queue.sqs_queue.id
  policy    = data.template_file.policy_sqs_json_sns_event.rendered
}