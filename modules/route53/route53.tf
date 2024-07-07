resource "aws_route53_zone" "primary" {
  name = var.route_name
  comment = "My website zone"

  # depends_on = [ aws_acm_certificate.mywebsite-certificate ]
}

resource "aws_route53_record" "mywebsite_record" {
  zone_id = var.zone_id
  name = var.route_name
  type = "A"
  alias {
    name = var.cloudfront_distribution_domain_name
    zone_id = var.cloudfront_distribution_zone_id
    evaluate_target_health = false
  }

  # depends_on = [ aws_cloudfront_distribution.mywebsite-distribution, aws_route53_zone.primary]
}