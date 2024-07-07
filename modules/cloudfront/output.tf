output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.mywebsite-distribution.domain_name
  
}
output "cloudfront" {
  value = aws_cloudfront_distribution.mywebsite-distribution
  
}

output "domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.mywebsite-distribution.domain_name
}
output "hosted_zone_id" {
  value = aws_cloudfront_distribution.mywebsite-distribution.hosted_zone_id
  
}
output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.mywebsite-distribution.id
}