resource "aws_s3_bucket" "raw" {
  bucket        = "s3-raw-${var.bucket_id}"
  force_destroy = true

  tags = {
    Name        = "Raw bucket"
    Environment = "dev"
  }
}

resource "aws_s3_object" "folder_raw" {
  depends_on = [
  aws_s3_bucket.raw]
  bucket = aws_s3_bucket.raw.id
  key    = "raw/"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.raw.id
  topic {
    topic_arn     = aws_sns_topic.topic_sns.arn
    events        = ["s3:ObjectCreated:*"]
    filter_prefix = aws_s3_object.folder_raw.key
    filter_suffix = ".csv"

  }
}