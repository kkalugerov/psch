module "task_execution_role_policy" {
  source = "../../../../../modules/iam/policy/v1.0"

  name = "ecs-task-role-execution-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ssm:GetParameters",
          "secretsmanager:GetSecretValue",
          "kms:Decrypt",
          "s3:GetObject",
          "s3:GetBucketLocation",
          "s3:ListBucket",
          "s3:Put",
          "rds:Describe*"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })
}

module "task_execution_role" {
  source     = "../../../../../modules/iam/role/v1.0"
  depends_on = [module.task_execution_role_policy]

  role_name               = "ecs-task-execution-role"
  trusted_role_services   = ["ecs-tasks.amazonaws.com"]
  custom_role_policy_arns = [module.task_execution_role_policy.arn]
}

output "ecs_task_execution_role_arn" {
  value = module.task_execution_role.role_arn
}

output "ecs_task_execution_role_name" {
  value = module.task_execution_role.role_name
}
