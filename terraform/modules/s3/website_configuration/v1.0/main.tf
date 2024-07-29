resource "aws_s3_bucket_website_configuration" "this" {
  bucket = var.bucket

  index_document {
    suffix = var.index_document_suffix
  }

  error_document {
    key = var.error_document_key
  }
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = var.bucket

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = var.bucket
  acl    = "private"
}

resource "aws_s3_bucket_policy" "this" {
  bucket = var.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "AllowGetObjects"
    Statement = [
      {
        Sid       = "AllowPublic"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = format("arn:aws:s3:::%s/**", var.bucket)
      }
    ]
  })
}
