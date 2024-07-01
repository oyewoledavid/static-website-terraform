resource "aws_route53_zone" "primary" {
  name = "kingdavid.me"
  comment = "My website zone"

  lifecycle {
    prevent_destroy = true
  
  }
}

resource "aws_route53_record" "mywebsite_record" {
  zone_id = aws_route53_zone.primary.zone_id
  name = "kingdavid.me"
  type = "A"
  alias {
    name = aws_cloudfront_distribution.mywebsite-distribution.domain_name
    zone_id = aws_cloudfront_distribution.mywebsite-distribution.hosted_zone_id
    evaluate_target_health = false
  }

  depends_on = [ aws_cloudfront_distribution.mywebsite-distribution, aws_route53_zone.primary]
}