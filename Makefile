vpc_init:
	echo ""
	echo "Initializing VPC"
	terraform -chdir=./terraform/solution/eu-west-1/network init

vpc_apply: vpc_init
	echo ""
	echo "Creating VPC"
	terraform -chdir=./terraform/solution/eu-west-1/network apply -auto-approve

alb_sg_init:
	echo ""
	echo "Initializing ALB Security Group"
	terraform -chdir=./terraform/solution/eu-west-1/security_groups/alb init

alb_sg_apply: alb_sg_init
	echo ""
	echo "Creating ALB Security Group"
	terraform -chdir=./terraform/solution/eu-west-1/security_groups/alb apply -auto-approve

ecs_sg_init:
	echo ""
	echo "Initializing ECS Security Group"
	terraform -chdir=./terraform/solution/eu-west-1/security_groups/ecs init

ecs_sg_apply: ecs_sg_init
	echo ""
	echo "Creating ECS Security Group"
	terraform -chdir=./terraform/solution/eu-west-1/security_groups/ecs apply -auto-approve

db_sg_init:
	echo ""
	echo "Initializing ECS Security Group"
	terraform -chdir=./terraform/solution/eu-west-1/security_groups/db init

db_sg_apply: db_sg_init
	echo ""
	echo "Creating DB Security Group"
	terraform -chdir=./terraform/solution/eu-west-1/security_groups/db apply -auto-approve

iam_init:
	echo ""
	echo "Initializing ECS Service Permissions"
	terraform -chdir=./terraform/solution/eu-west-1/iam/ecs/service init

iam_apply: iam_init
	echo ""
	echo "Creating ECS Service Permissions"
	terraform -chdir=./terraform/solution/eu-west-1/iam/ecs/service apply -auto-approve

elb_init:
	echo ""
	echo "Initializing ELB"
	terraform -chdir=./terraform/solution/eu-west-1/elb init

elb_apply: elb_init
	echo ""
	echo "Creating ELB"
	terraform -chdir=./terraform/solution/eu-west-1/elb apply -auto-approve

ecs_cluster_init:
	echo ""
	echo "Initializing ECS Cluster"
	terraform -chdir=./terraform/solution/eu-west-1/ecs/cluster init

ecs_cluster_apply: ecs_cluster_init
	echo ""
	echo "Creating ELB Cluster"
	terraform -chdir=./terraform/solution/eu-west-1/ecs/cluster apply -auto-approve

ecs_service_init:
	echo ""
	echo "Initializing ECS service"
	terraform -chdir=./terraform/solution/eu-west-1/ecs/service init

ecs_service_apply: ecs_service_init
	echo ""
	echo "Creating ECS Service"
	terraform -chdir=./terraform/solution/eu-west-1/ecs/service apply -auto-approve

rds_sub_group_init:
	echo ""
	echo "Initializing Database Subnet Group"
	terraform -chdir=./terraform/solution/eu-west-1/rds/subnet_group init

rds_sub_group_apply: rds_sub_group_init
	echo ""
	echo "Creating Database Subnet Group"
	terraform -chdir=./terraform/solution/eu-west-1/rds/subnet_group apply -auto-approve

rds_init:
	echo ""
	echo "Initializing Database"
	terraform -chdir=./terraform/solution/eu-west-1/rds/database init

rds_apply: rds_init
	echo ""
	echo "Creating Database"
	terraform -chdir=./terraform/solution/eu-west-1/rds/database apply -auto-approve

app_cf_dist_log_init:
	echo ""
	echo "Initializing App CloudFront Logging Configuration"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/app/logging init

app_cf_dist_log_apply: app_cf_dist_log_init
	echo ""
	echo "Creating App CloudFront Logging Configuration"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/app/logging apply -auto-approve

app_cf_dist_init:
	echo ""
	echo "Initializing App CloudFront Distribution"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/app/distribution init

app_cf_dist_apply: app_cf_dist_log_apply app_cf_dist_init
	echo ""
	echo "Creating App CloudFront Distribution"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/app/distribution apply -auto-approve

sa_cf_dist_log_init:
	echo ""
	echo "Initializing Static Assets CloudFront Logging Configuration"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/static_assets/logging init

sa_cf_dist_log_apply: sa_cf_dist_log_init
	echo ""
	echo "Creating Static Assets CloudFront Logging Configuration"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/static_assets/logging apply -auto-approve

sa_cf_origin_init: sa_cf_dist_log_apply
	echo ""
	echo "Initializing Static Assets Origin"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/static_assets/origin init

sa_cf_origin_apply: sa_cf_origin_init
	echo ""
	echo "Creating Static Assets Origin"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/static_assets/origin apply -auto-approve

sa_cf_dist_init: 
	echo ""
	echo "Initializing Static Assets CloudFront Distribution"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/static_assets/distribution init

sa_cf_dist_apply: sa_cf_origin_apply sa_cf_dist_init 
	echo ""
	echo "Creating Static Assets CloudFront Distribution"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/static_assets/distribution apply -auto-approve

vpc: vpc_apply
sg: alb_sg_apply ecs_sg_apply db_sg_apply
iam: iam_apply
elb: elb_apply
ecs: ecs_cluster_apply ecs_service_apply
rds: rds_sub_group_apply rds_apply
cf: app_cf_dist_apply sa_cf_dist_apply

create_all: vpc sg iam elb ecs cf

vpc_destroy:
	echo ""
	echo "Destroying VPC"
	terraform -chdir=./terraform/solution/eu-west-1/network destroy -auto-approve

alb_sg_destroy:
	echo ""
	echo "Destroying ALB Security Group"
	terraform -chdir=./terraform/solution/eu-west-1/security_groups/alb destroy -auto-approve

ecs_sg_destroy:
	echo ""
	echo "Destroying ECS Security Group"
	terraform -chdir=./terraform/solution/eu-west-1/security_groups/ecs destroy -auto-approve

db_sg_destroy:
	echo ""
	echo "Destroying DB Security Group"
	terraform -chdir=./terraform/solution/eu-west-1/security_groups/db destroy -auto-approve

iam_destroy:
	echo ""
	echo "Destroying IAM Service Permissions"
	terraform -chdir=./terraform/solution/eu-west-1/iam/ecs/service destroy -auto-approve

elb_destroy:
	echo ""
	echo "Destroying ELB"
	terraform -chdir=./terraform/solution/eu-west-1/elb destroy -auto-approve

ecs_cluster_destroy: 
	echo ""
	echo "Destroying ELB Cluster"
	terraform -chdir=./terraform/solution/eu-west-1/ecs/cluster destroy -auto-approve

ecs_service_destroy:
	echo ""
	echo "Destroying ECS Service"
	terraform -chdir=./terraform/solution/eu-west-1/ecs/service destroy -auto-approve

rds_sub_group_destroy:
	echo ""
	echo "Destroying Database Subnet Group"
	terraform -chdir=./terraform/solution/eu-west-1/rds/subnet_group destroy -auto-approve

rds_destroy: 
	echo ""
	echo "Destroing Database"
	terraform -chdir=./terraform/solution/eu-west-1/rds/database destroy -auto-approve

app_cf_dist_log_destroy:
	echo ""
	echo "Destroying App CloudFront Logging Configuration"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/app/logging destroy -auto-approve

app_cf_dist_destroy:
	echo ""
	echo "Destroying App CloudFront Distribution"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/app/distribution destroy -auto-approve

sa_cf_dist_log_destroy: 
	echo ""
	echo "Destroying Static Assets CloudFront Logging Configuration"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/static_assets/logging destroy -auto-approve

sa_cf_origin_distroy: 
	echo ""
	echo "Destroying Static Assets Origin"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/static_assets/origin destroy -auto-approve

sa_cf_dist_destroy: 
	echo ""
	echo "Destroying Static Assets CloudFront Distribution"
	terraform -chdir=./terraform/solution/eu-west-1/cloudfront/static_assets/distribution destroy -auto-approve

cf_destroy: sa_cf_dist_destroy sa_cf_origin_distroy sa_cf_dist_log_destroy app_cf_dist_destroy app_cf_dist_log_destroy
ecs_destroy: ecs_service_destroy ecs_cluster_destroy
sg_destroy: db_sg_destroy ecs_sg_destroy alb_sg_destroy


destroy_all: cf_destroy ecs_destroy elb_destroy iam_destroy sg_destroy vpc_destroy
