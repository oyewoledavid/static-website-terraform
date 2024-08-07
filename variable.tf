variable "domain_name" {
  description = "The domain name of the CloudFront distribution"
  type        = string
  
}

variable "bucket_name" {
    description = "The name of the S3 bucket"
    type        = string
}

variable "route_name" {
  description = "The name of the Route53 record"
  type        = string
  
}
variable "zone_id" {
  description = "The ID of the Route53 zone"
  type        = string
}