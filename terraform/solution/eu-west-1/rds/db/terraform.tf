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

module "database" {
  source         = "../../../../modules/rds/instance/v1.0"
  identifier     = "db-identifier"
  engine         = "postgres"
  instance_class = "db.m5.large"
  ### ETC parameters
}
