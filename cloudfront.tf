
resource "aws_cloudfront_distribution" "mywebsite-distribution" {
  origin {
    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.bucket.bucket_regional_domain_name
  
      s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }
  aliases = ["kingdavid.me"]
  enabled = true
  is_ipv6_enabled = false
  comment = "My website distribution"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.bucket.bucket_regional_domain_name

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }
  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method = "sni-only"
    acm_certificate_arn = aws_acm_certificate.mycert.arn
  }

  depends_on = [ aws_s3_bucket.bucket ]
}

// CLOUD FRONT ORIGIN ACCESS IDENTITY

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "My website origin access identity"
}

// BUCKET POLICY TO ALLOW CLOUDFRONT TO ACCESS THE BUCKET

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "AllowCloudFrontServicePrincipalReadOnly",
        Effect = "Allow",
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
        },
        Action = "s3:GetObject",
        Resource = "${aws_s3_bucket.bucket.arn}/*"
      }
    ]
  })

  depends_on = [ aws_cloudfront_origin_access_identity.origin_access_identity, aws_s3_bucket.bucket]
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.mywebsite-distribution.domain_name
  
  
}

