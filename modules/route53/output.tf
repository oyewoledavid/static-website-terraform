output "zone_id" {
    value = aws_route53_zone.primary.zone_id
}
output "route53_record" {
    value = aws_route53_record.mywebsite_record
}
