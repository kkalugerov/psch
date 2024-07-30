provider "aws" {
  default_tags {
    tags = {
      "Deployment" = "Terraform"
      "Owner"      = "Kristiyan Kalugerov"
      "DeleteMe"   = "No"
    }
  }
}

module "cloudfront_distribution" {
  source = "../../../../../modules/cloudfront/distribution/v1.0"

  origin_id              = "kkalugeroff"
  domain_name            = data.terraform_remote_state.elb.outputs.lb_dns_name
  origin_protocol_policy = "http-only"
  origin_ssl_protocols   = ["TLSv1"]
  viewer_protocol_policy = "allow-all"

  logging_config = {
    include_cookies = "false"
    bucket          = data.terraform_remote_state.bucket.outputs.bucket_name
    prefix          = "web-app/"
  }
}

output "distribution_domain_name" {
  value = module.cloudfront_distribution.domain_name
}
