provider "aws" {
  region = "ap-southeast-1"
  version = "1.38"
}

resource "aws_route53_zone" "isomerpages_com_zone" {
  name = "isomerpages.com."
}

# For AWS Route53 zones, the SOA and NS records are created automatically
# Hence, they are not defined here.
# If you would like to use another name server (e.g. CloudFlare), you may define a NS resource below

resource "aws_route53_record" "isomerpages_com_govtech_isomerpages_com_cname" {
  # This refers to the id that will be given when terraform applies the zone above
  zone_id = "${aws_route53_zone.isomerpages_com_zone.zone_id}"
  name = "govtech.isomerpages.com."
  type = "CNAME"
  ttl = 300
  records = ["isomerpages.github.io"]
}

resource "aws_route53_record" "isomerpages_com_hlb_isomerpages_com_cname" {
  zone_id = "${aws_route53_zone.isomerpages_com_zone.zone_id}"
  name = "hlb.isomerpages.com."
  type = "CNAME"
  ttl = 300
  records = ["d3owwuwxtxaalq.cloudfront.net"]
}
