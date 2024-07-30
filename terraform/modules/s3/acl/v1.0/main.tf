resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = var.bucket
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
data "aws_canonical_user_id" "current" {

}
resource "aws_s3_bucket_acl" "this" {
  depends_on = [aws_s3_bucket_ownership_controls.this]

  bucket = var.bucket
  access_control_policy {
    owner {
      id = data.aws_canonical_user_id.current.id
    }

    grant {
      grantee {
        id   = data.aws_canonical_user_id.current.id
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }

    dynamic "grant" {
      for_each = length(var.grants) > 0 ? var.grants : {}

      content {
        grantee {
          id   = lookup(grant.value, "id", null)
          type = lookup(grant.value, "type", null)
        }
        permission = lookup(grant.value, "permission", null)
      }
    }
  }
}
