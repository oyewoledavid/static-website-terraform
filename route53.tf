resource "aws_route53_zone" "mywebsite_zone" {
  name = "kingdavid.me"  
}

resource "aws_route53_record" "mywebsite_record" {
  zone_id = aws_route53_zone.mywebsite_zone.zone_id
  name = "www.kingdavid.me"
  type = "A"
  alias {
    name = aws_cloudfront_distribution.mywebsite-distribution.domain_name
    zone_id = aws_cloudfront_distribution.mywebsite-distribution.hosted_zone_id
    evaluate_target_health = false
  }
}