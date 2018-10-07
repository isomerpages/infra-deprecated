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