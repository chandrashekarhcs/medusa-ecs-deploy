output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnets"
  value       = module.vpc.public_subnets
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.medusa_cluster.name
}

output "medusa_service_name" {
  description = "Name of the ECS Service running Medusa"
  value       = aws_ecs_service.medusa_service.name
}

output "medusa_task_definition" {
  description = "ARN of the task definition"
  value       = aws_ecs_task_definition.medusa_task.arn
}
