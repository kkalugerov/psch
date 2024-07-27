resource "aws_s3_bucket_versioning" "versioning" {
  count = var.enable ? 1 : 0

  bucket = var.bucket
  versioning_configuration {
    status     = var.versioning_inputs["status"]
    mfa_delete = var.versioning_inputs["mfa_delete"]
  }
}
