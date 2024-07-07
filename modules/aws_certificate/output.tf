output "certificate_domain_name" {
  value = aws_acm_certificate.mycert.domain_name
  
}
output "certificate_arn" {
  value = aws_acm_certificate.mycert.arn
}
output "certificate_validation_record" {
  value = aws_route53_record.mycert_validation
}
