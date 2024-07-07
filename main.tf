
module "aws_s3_bucket" {
  source = "./modules/s3-bucket/"
  bucket_name = var.bucket_name

}

module "aws_cloudfront_distribution" {
  source = "./modules/cloudfront/"
  domain_name = var.domain_name
  s3_bucket_domain_name = module.aws_s3_bucket.bucket_regional_domain_name
  s3_bucket_origin_id = module.aws_s3_bucket.bucket_origin_id
  acm_certificate_arn = module.aws_acm_certificate.certificate_arn
  s3_bucket_arn = module.aws_s3_bucket.bucket
  bucket = module.aws_s3_bucket.bucket_name
  bucket_name = module.aws_s3_bucket.bucket_name
}

module "aws_route53_zone" {
  source = "./modules/route53/"
  route_name = var.route_name
  zone_id = var.zone_id
  cloudfront_distribution_domain_name = module.aws_cloudfront_distribution.domain_name
  cloudfront_distribution_zone_id = module.aws_cloudfront_distribution.hosted_zone_id
  
}
module "aws_acm_certificate" {
  source = "./modules/aws_certificate/"
  domain_name = var.domain_name
  zone_id = module.aws_route53_zone.zone_id
}