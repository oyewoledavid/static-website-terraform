# variable "bucket_name" {
#   description = "The name of the S3 bucket"
#   type        = string
#   default = "david-altschool-tf-s3-bucket"
  
# }

# module "s3_bucket" {
#   source = "./modules/s3_bucket/"
#   bucket_name = module.s3_bucket.bucket.id
# }
# module "cloudfront" {
#   source = "./modules/cloudfront/"
#   bucket_name = module.s3_bucket.bucket
# }
