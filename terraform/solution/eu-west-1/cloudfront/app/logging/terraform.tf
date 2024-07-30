provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      "Deployment" = "Terraform"
      "Owner"      = "Kristiyan Kalugerov"
      "DeleteMe"   = "No"
    }
  }
}

module "web_app_logging_bucket" {
  source = "../../../../../modules/s3/bucket/v1.0"

  bucket             = "web-app-logging-bucket"
  bucket_description = "Web App Logging Bucket "
  force_destroy      = true
}

module "bucket_encryption" {
  source = "../../../../../modules/s3/encryption/v1.0"

  depends_on    = [module.web_app_logging_bucket]
  enable        = true
  bucket        = module.web_app_logging_bucket.bucket_name
  sse_algorithm = "AES256"
}

module "acl" {
  source = "../../../../../modules/s3/acl/v1.0"

  bucket = module.web_app_logging_bucket.bucket_name
  grants = {
    cloudfront = {
      id         = data.aws_cloudfront_log_delivery_canonical_user_id.user.id
      type       = "CanonicalUser"
      permission = "FULL_CONTROL"
    }
  }
}

output "bucket_name" {
  value = module.web_app_logging_bucket.bucket_name
}

output "bucket_arn" {
  value = module.web_app_logging_bucket.bucket_arn
}
