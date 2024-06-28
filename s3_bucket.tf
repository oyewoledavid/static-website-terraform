
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

output "bucket_id" {
    value = aws_s3_bucket.bucket.id
  
}


# BUCKET POLICY TO ALLOW ACCESS FROM OTHERS
data "aws_iam_policy_document" "allow_access_from_others" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.bucket.arn,
      "${aws_s3_bucket.bucket.arn}/*",
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  
  }
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

// BUCKET POLICY TO ALLOW PUBLIC ACCESS
data "aws_iam_policy_document" "public_access" {
  statement {
    actions   = ["s3:GetObject"]
    resources = [aws_s3_bucket.bucket.arn]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    effect = "Allow"
  }
}


# resource "aws_s3_bucket_policy" "bucket_policy" {
#   bucket = aws_s3_bucket.bucket.id
#   policy = data.aws_iam_policy_document.public_access.json
# }

