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

module "app" {
  source = "../../../../modules/ecr/v1.0"

  identifier = "kalugeroff"
  name       = "python-web-app"
}

output "repository_url" {
  value = module.app.repository_url
}
