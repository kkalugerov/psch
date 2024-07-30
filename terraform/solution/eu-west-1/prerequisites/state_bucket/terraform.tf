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

module "state_bucket" {
  source = "../../../../modules/s3/bucket/v1.0"

  bucket             = "terraform-state-bucket"
  bucket_description = "Terraform State Bucket"
  force_destroy      = true
}

module "bucket_encryption" {
  source = "../../../../modules/s3/encryption/v1.0"

  depends_on    = [module.state_bucket]
  enable        = true
  bucket        = module.state_bucket.bucket_name
  sse_algorithm = "AES256"
}

module "bucket_versioning" {
  source = "../../../../modules/s3/versioning/v1.0"

  depends_on = [module.state_bucket]
  bucket     = module.state_bucket.bucket_name
  versioning_inputs = {
    status     = "Enabled"
    mfa_delete = "Disabled"
  }
}

output "bucket_name" {
  value = module.state_bucket.bucket_name
}

output "bucket_arn" {
  value = module.state_bucket.bucket_arn
}
