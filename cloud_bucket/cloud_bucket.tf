# AWS S3 Bucket for HLB

resource "aws_s3_bucket" "isomer_hlb" {
  bucket = "isomer-hlb.gov.sg"
}

resource "aws_s3_bucket_policy" "isomer_hlb" {
  bucket = "${aws_s3_bucket.isomer_hlb.id}"
  policy =<<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
	"Sid": "PublicReadGetObject",
	"Effect": "Allow",
	"Principal": "*",
	"Action": "s3:GetObject",
	"Resource": "arn:aws:s3:::isomer-hlb.gov.sg/*"
    }
  ]
}
POLICY
  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}

# AWS S3 Bucket to store CloudFront logs
resource "aws_s3_bucket" "isomer_logs" {
  bucket = "isomer-logs.gov.sg"
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_policy" "isomer_logs" {
  bucket = "${aws_s3_bucket.isomer_logs.id}"
  acl    = "private"

  logging {
    target_bucket = "${aws_s3_bucket.isomer_logs.id}"
    target_prefix = "log/"
  }
}