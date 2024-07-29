module "app" {
  source = "../../../../modules/ecr/v1.0"

  identifier = "kalugeroff"
  name       = "python-web-app"
}

output "repository_url" {
  value = module.app.repository_url
}
