resource "aws_ecr_repository" "repository" {
  name                 = format("%s-%s", var.identifier, var.name)
  image_tag_mutability = var.mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  force_delete = var.force_delete

  encryption_configuration {
    encryption_type = var.encryption_type
    kms_key         = var.encryption_type == "KMS" ? var.kms_key_arn : null
  }

  tags = {
    "Name" = format("%s-%s", var.identifier, var.name)
  }
}
