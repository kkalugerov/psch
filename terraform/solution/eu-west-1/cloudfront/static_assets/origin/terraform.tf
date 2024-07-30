module "static_web_bucket" {
  source = "../../../../../modules/s3/bucket/v1.0"

  bucket             = "static-web"
  bucket_description = "A bucket used to host static website"
}

module "block_public_access" {
  source = "../../../../../modules/s3/block_public_access/v1.0"

  enable = true
  bucket = module.static_web_bucket.bucket_name
  public_access = {
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
  }
}

module "static_web_bucket_config" {
  source = "../../../../../modules/s3/website_configuration/v1.0"

  bucket                = module.static_web_bucket.bucket_name
  index_document_suffix = "index.html"
  error_document_key    = "index.html"
}

output "website_domain" {
  value = module.static_web_bucket_config.website_domain
}

output "website_endpoint" {
  value = module.static_web_bucket_config.website_endpoint
}

output "static_web_bucket" {
  value = module.static_web_bucket.bucket_name
}
