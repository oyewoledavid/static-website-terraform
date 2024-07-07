variable "domain_name" {
  description = "The domain name of the CloudFront distribution"
  type        = string
  
}
variable "s3_bucket_domain_name" {
  description = "The domain name of the S3 bucket to be used by CloudFront"
  type        = string
}
variable "s3_bucket_origin_id" {
  description = "The origin ID of the S3 bucket to be used by CloudFront"
  type        = string
  
}
variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate to be used by CloudFront"
  type        = string
  
}
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  
}
variable "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  type = any
  
}
variable "bucket" {
  description = "The S3 bucket object"
  type        = any
  
}