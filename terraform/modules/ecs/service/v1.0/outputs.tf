output "service_id" {
  description = "ARN that identifies the service"
  value       = aws_ecs_service.this.id
}

output "service_name" {
  description = "Name of the service"
  value       = aws_ecs_service.this.name
}

output "task_definition_arn" {
  description = "Full ARN of the Task Definition (including both `family` and `revision`)"
  value       = aws_ecs_task_definition.this.arn
}

output "task_definition_revision" {
  description = "Revision of the task in a particular family"
  value       = aws_ecs_task_definition.this.revision
}

output "task_definition_family" {
  description = "The unique name of the task definition"
  value       = aws_ecs_task_definition.this.family
}
