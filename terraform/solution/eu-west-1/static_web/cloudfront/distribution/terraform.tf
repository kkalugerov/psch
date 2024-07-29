module "cloudfront_distribution" {
  source = "../../../../../modules/cloudfront/distribution/v1.0"
  origin_id = data.terraform_remote_state.static_web_origin.outputs.static_web_bucket
  domain_name = data.terraform_remote_state.static_web_origin.outputs.website_domain
}