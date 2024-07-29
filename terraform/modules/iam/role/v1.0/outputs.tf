output "role_arn" {
  description = "ARN of IAM role"
  value       = aws_iam_role.role.arn
}

output "role_name" {
  description = "Name of IAM role"
  value       = aws_iam_role.role.name
}

output "role_path" {
  description = "Path of IAM role"
  value       = aws_iam_role.role.path
}

output "role_id" {
  description = "IAM role id"
  value       = aws_iam_role.role.id
}
