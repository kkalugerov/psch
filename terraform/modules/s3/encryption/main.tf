resource "aws_kms_key" "encryption_key" {
  count                   = var.sse_algorithm == "aws:kms" || var.sse_algorithm == "aws:kms:ddse" ? 1 : 0
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 7
}

resource "aws_kms_alias" "encryption_key_alias" {
  count         = var.sse_algorithm == "aws:kms" || var.sse_algorithm == "aws:kms:ddse" ? 1 : 0
  name          = format("alias/%s-%s-bucket-encryption-key", var.prefix, var.region)
  target_key_id = aws_kms_key.encryption_key[0].key_id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_configuration" {
  count = var.enable ? 1 : 0

  bucket = var.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.sse_algorithm == "aws:kms" || var.sse_algorithm == "aws:kms:ddse" ? aws_kms_key.encryption_key[0].arn : null
      sse_algorithm     = var.sse_algorithm
    }
  }
}
