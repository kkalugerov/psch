resource "aws_s3_bucket_public_access_block" "block_public_access" {

  count  = var.enable ? 1 : 0
  bucket = var.bucket

  block_public_acls       = var.public_access["block_public_acls"]
  block_public_policy     = var.public_access["block_public_policy"]
  ignore_public_acls      = var.public_access["ignore_public_acls"]
  restrict_public_buckets = var.public_access["restrict_public_buckets"]
}
