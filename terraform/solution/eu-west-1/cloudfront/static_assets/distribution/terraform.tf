module "cloudfront_distribution" {
  source = "../../../../../modules/cloudfront/distribution/v1.0"

  origin_id              = data.terraform_remote_state.static_web_origin.outputs.static_web_bucket
  domain_name            = data.terraform_remote_state.static_web_origin.outputs.website_endpoint
  origin_protocol_policy = "http-only"
  origin_ssl_protocols   = ["TLSv1"]
  viewer_protocol_policy = "allow-all"

  logging_config = {
    include_cookies = "false"
    bucket          = data.terraform_remote_state.bucket.outputs.bucket_name
    prefix          = "static-assets/"
  }
}

output "distribution_domain_name" {
  value = module.cloudfront_distribution.domain_name
}
