resource "aws_s3_bucket" "raw" {
  bucket = "s3-raw-lounis-8492034"
  force_destroy = true

  tags = {
    Name        = "Raw bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "folder_raw" {
   depends_on = [
  aws_s3_bucket.raw]
  bucket = aws_s3_bucket.raw.id
  key    = "/raw/"
}