resource "aws_sns_topic" "sns-s3" {
  name = "sns-s3"


  policy  = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "SNS:Publish",
      "Resource": "arn:aws:sns:*:*:sns-s3",
      "Condition": {
        "ArnLike": {
          "aws:SourceArn": "arn:aws:s3:*:*:*"
        }
      }
    }
  ]
}
EOF
}

resource "aws_sns_topic_subscription" "sns-sub-mail" {
  topic_arn = aws_sns_topic.sns-s3.arn
  protocol = "email"
  endpoint = "david.deif1997@gmail.com"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.bucket-11-lab.id
  topic {
    topic_arn     = aws_sns_topic.sns-s3.arn
    events        = ["s3:ObjectCreated:*"]
  }
}

