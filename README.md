# DevOps Challenge
   
## Prerequisites
 Current Infrastructure Details Guide:

    - A dedicated AWS account with a single VPC hosting multiple environments
    - VPC has the usual segregated networks meeting best practices
    - Web frontend is a simple hello world running in basic CloudFront with an S3 backend. No WAF, no geo IP limitations
    - Application load balancer offloading SSL and passing traffic onto target groups in a simple round robin fashion
    - ECS cluster running standard AWS ECS linux running a simple restful container, e.g. GET acme.com/helloworld
    - RDS database running a PostrgreSQL database, single az
    - The usual Security groups to protect infrastructure and customer data against attack.   


## Based on the prerequisites the infrastructure has been identified as follows:

### Region
- Ireland(eu-west-1)

### Networking
- 1 VPC
    - 10.0.0.0/16 
- 2 Public Subnets(used by Application Load Balancer):
    - 10.0.0.0/20 
    - 10.0.16.0/20
- 2 Private Subnets(used by ECS Fargate Service)
    - 10.0.32.0/20
    - 10.0.48.0/20
- 2 Private Database Subnets(used by RDS instance):
    - 10.0.64.0/20
    - 10.0.80.0/20
- 1 Public Route Table associated with 2 Public Subnets
- 2 Private Route Tables associated with 2 Private Subnets
- 1 Database Route Table associated with 2 Private Database Subnets
- 1 Internet Gateway
- 1 NAT Gateway
- Each Subnet has 4096 IPs available to the application can scale a bit in case of need

### Security Groups
- ECS Security Group:
    - allowing traffic on port 8080 from Application Load Balancer SG
- ALB Security Group:
    - allow traffic on port 80 from CloudFront prefix list
- RDS Security Group:
    - allowing all traffic from ASG SG

### Compute
- ECS Cluster and a CloudWatch log group
- ECS Service using Fargate - running simple web application(Hello World) and a CloudWatch log group
  <br>Note: Fargate was used in order to reduce the complexity around managing EC2s and whatever components they have in relation</br>
- Application Load Balancer with Listener on port 80 - serving content from ECS service
  Note: Due to missing SSL/TLS Certificate there isn't listener on port 443 configured. This is the reason behind missing SSL offloading.

### Database
- Postgres RDS(single region instance)
- Subnet Group

### CDN
- CloudFront Distribution serving static assets
- CloudFront Distribution serving web app

### Storage
- S3 bucket used for storing IaC state
- S3 bucket used as CloudFront origin serving static assets
- S3 bucket used as logging storage for CloudFront distro serving static assets
- S3 bucket used as logging storage for CloudFront distro serving web app

### IAM
- ECS task execution role with policies
- S3 resource policy

## Migration Plan and Steps

1. Prepare Terraform modules for existing resources
2. Configure modules invocation for the resources to be imported
3. Run `terraform import` command e.g.:
```
terraform import module.vpc.aws_vpc.this <VPC ID>
```
4. Observe state files and `plan` output
5. Improve config to avoid replacement/changes
 
Note: What type of import method we are going to use depend on the Terraform version we can use. If we can use Terraform v 1.5 and above we may consider using `import block {}` e.g:
```
import {
    to = module.vpc.aws_vpc.this
    id = <VPC ID>
}
```
Later on we can run `terraform plan -generate-config-out=terraform.tf` which will generate a file with resource content.

## Folder Structure

### Module Level
```
| -- modules
   | -- cloudfront
   |   -- distribution
   |       -- v1.0
   | -- ecr
   |   -- v1.0
   | -- ecs
   |   | -- cluster
   |   |   -- v1.0
   |   | -- service
   |   |   -- v1.0
   | -- elb
   |   -- v1.0
   | -- iam
   |   | -- policy
   |   |   -- v1.0
   |   | -- role
   |   |   -- v1.0
   | -- network
   |   -- v1.0
   | -- rds
   |   | -- instance
   |   |   -- v1.0
   |   | -- subnet_group
   |   |    -- v1.0
   | -- s3
   |   | -- acl
   |   |   -- v1.0
   |   | -- block_public_access
   |   |   -- v1.0
   |   | -- bucket
   |   |   -- v1.0
   |   | -- encryption
   |   |   -- v1.0
   |   | -- versioning
   |   |   -- v1.0
   |   | -- website_configuration
   |   |   -- v1.0
   | -- security_groups
   |    -- v1.0
```

### Solution Level
```
| -- solution
    | -- eu-west-1
        | -- cloudfront
        |   | -- app
        |   |   | -- distribution
        |   |   | -- logging
        |   | -- static_assets
        |       | -- distribution
        |       | -- logging
        |       | -- origin
        | -- ecr
        |   | -- app
        | -- ecs
        |   | -- cluster
        |   | -- service
        | -- elb
        | -- iam
        |   | -- ecs
        |       | -- service
        | -- network
        | -- prerequisites
        |   | -- state_bucket
        | -- rds
        |   | -- db
        |   | -- subnet_group
        | -- security_groups
        |    | -- alb
        |    | -- db
        |    | -- ecs
```

## Prerequisites for creation
- AWS permissions exported as AWS_DEFAULT_REGION AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY environmental variables

## Order of resource creation

1. VPC
2. Security Groups
3. IAM Permissions
4. Application Load Balancer
5. Database
6. ECS Cluster
7. ECS Service
8. S3 bucket hosting Static Assets
8. S3 bucket used as logging storage for Static Assets CloudFront Distribution
9. Static Assets CloudFront Distribution
10. S3 bucket used as logging storage for Web App CloudFront Distribution
11. Web App CloudFront Distribution

<br> Note: make create_all can be used to create all the infrastructure components.
     A couple of existing are excluded like RDS(currently there isn't application communication established with it) and ECR(an image needs to exists in advance).
</br>