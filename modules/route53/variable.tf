variable "route_name" {
  description = "The name of the Route53 record"
  type        = string
  
}
variable "zone_id" {
  description = "The ID of the Route53 zone"
  type        = string
}

variable "cloudfront_distribution_domain_name" {
  description = "Domain name of the CloudFront distribution"
  type        = string
}

variable "cloudfront_distribution_zone_id" {
  description = "The CloudFront distribution object"
  type        = any
  
}