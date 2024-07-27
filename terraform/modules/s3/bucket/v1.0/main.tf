resource "aws_s3_bucket" "this" {
  bucket        = format("%s-%s-%s", var.prefix, var.region, var.bucket)
  force_destroy = var.force_destroy

  tags = {
    Name        = format("%s-%s-%s", var.prefix, var.region, var.bucket)
    Description = var.bucket_description
  }

  lifecycle {
    prevent_destroy = false
  }
}
