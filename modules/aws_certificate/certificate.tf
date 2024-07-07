resource "aws_acm_certificate" "mycert" {
  domain_name       = var.domain_name
  validation_method = "DNS"

}


resource "aws_route53_record" "mycert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.mycert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

    zone_id = var.zone_id
    name    = each.value.name
    type    = each.value.type
    records = [each.value.record]
    ttl     = 60

    depends_on = [ aws_acm_certificate.mycert ]
}

resource "aws_acm_certificate_validation" "mycert_validation" {
  certificate_arn         = aws_acm_certificate.mycert.arn
  validation_record_fqdns = [for record in aws_route53_record.mycert_validation : record.fqdn]

  depends_on = [ aws_route53_record.mycert_validation, aws_acm_certificate.mycert]
}
