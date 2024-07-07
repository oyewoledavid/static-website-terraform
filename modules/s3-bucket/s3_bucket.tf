
resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket_name
    force_destroy = true

    tags = {
        Name = var.bucket_name
    }
}
resource "aws_s3_object" "website_files" {
    for_each = fileset("./website", "**/*")
    bucket = aws_s3_bucket.bucket.bucket
    key = each.value
    source = "website/${each.value}"
    content_type = each.value
}

resource "aws_s3_account_public_access_block" "block_access" {
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true

}
resource "aws_s3_bucket_website_configuration" "mywebsite" {
  bucket = aws_s3_bucket.bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
  
}