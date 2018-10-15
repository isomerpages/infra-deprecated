# Resource name convention: isomer_cdn_[url_in_underscore]
# Origin ID convention:     isomer_github_pages_[repo name]
# Logging Bucket:           isomer_[url_in_underscore]_logs
resource "aws_cloudfront_distribution" "isomer_cdn_markdown_isomer_gov_sg" {
  origin {
    origin_id   = "isomer_github_pages_isomerpages_markdown_isomergovsg"
    domain_name = "isomerpages.github.io"
    origin_path = "/markdown-helper"

    custom_origin_config {
      http_port = 80
      https_port = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  aliases = ["markdown.isomer.gov.sg"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "isomer_github_pages_isomerpages_markdown_isomergovsg"

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 86400
    default_ttl            = 86400
    max_ttl                = 31536000
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    ssl_support_method = "sni-only"
    acm_certificate_arn = "arn:aws:acm:us-east-1:095733531422:certificate/10979a60-e60e-405a-b1ef-7b31cc5b74e1"
  }

  logging_config {
    include_cookies = false
    bucket = "${aws_s3_bucket.isomer_cdn_logs_isomer_gov_sg.id}.s3.amazonaws.com"
  }
}