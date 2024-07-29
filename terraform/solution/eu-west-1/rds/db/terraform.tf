module "database" {
  source         = "../../../../modules/rds/instance/v1.0"
  identifier     = "db-identifier"
  engine         = "postgres"
  instance_class = "db.m5.large"
  ### ETC parameters
}
