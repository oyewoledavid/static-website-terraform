
# IAM Role
resource "aws_iam_role" "kingdavid_role" {
    name = "kingdavid-role"

    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

# IAM Role Policy for S3
resource "aws_iam_role_policy" "s3_policy" {
    name   = "s3-policy"
    role   = aws_iam_role.kingdavid_role.id

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

# IAM Role Policy for CloudFront
resource "aws_iam_role_policy" "cloudfront_policy" {
    name   = "cloudfront-policy"
    role   = aws_iam_role.kingdavid_role.id

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "cloudfront:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}


# IAM Role Policy for Route53
resource "aws_iam_role_policy" "route53_policy" {
    name   = "route53-policy"
    role   = aws_iam_role.kingdavid_role.id

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "route53:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
# IAM Role Policy for Certificate Manager
resource "aws_iam_role_policy" "certificate_manager_policy" {
    name   = "certificate-manager-policy"
    role   = aws_iam_role.kingdavid_role.id

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "acm:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}