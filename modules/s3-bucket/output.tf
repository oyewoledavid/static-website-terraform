output "bucket" {
    value = aws_s3_bucket.bucket.id
}
output "bucket_id" {
    value = aws_s3_bucket.bucket.id
  
}
output "bucket_regional_domain_name" {
    value = aws_s3_bucket.bucket.bucket_regional_domain_name
}
output "bucket_origin_id" {
    //value = aws_s3_bucket.bucket_origin_id
  value = aws_s3_bucket.bucket.bucket_regional_domain_name
}
output "s3_bucket_arn" {
    value = aws_s3_bucket.bucket.arn
  
}
output "bucket_name" {
    value = aws_s3_bucket.bucket.bucket
}