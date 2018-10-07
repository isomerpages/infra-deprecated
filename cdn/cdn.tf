resource "aws_cloudfront_distribution" "isomer_hlb" {
  origin {
    domain_name = "isomerpages.github.io"
    origin_path = "/isomerpages-hlb"
    origin_id   = "isomer-hlb"
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  logging_config {
    include_cookies = false
    bucket          = "isomer-logs.gov.sg"
  }

  aliases = ["www.hlb.gov.sg", "hlb.gov.sg"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "isomer-hlb"

    forwarded_values {
      query_string = false # Not sure about this one

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
    acm_certificate_arn = "" # Not sure about this one either
  }
}
