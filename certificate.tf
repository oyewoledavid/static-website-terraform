resource "aws_acm_certificate" "mycert" {
  domain_name       = "kingdavid.me"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_route53_record" "mycert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.mycert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

    zone_id = aws_route53_zone.mywebsite_zone.zone_id
    name    = each.value.name
    type    = each.value.type
    records = [each.value.record]
    ttl     = 60
}

resource "aws_acm_certificate_validation" "mycert_validation" {
  certificate_arn         = aws_acm_certificate.mycert.arn
  validation_record_fqdns = [for record in aws_route53_record.mycert_validation : record.fqdn]
}
