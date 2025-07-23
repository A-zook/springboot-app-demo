output "vpc_id" {
  description = "The ID of the VPC"
  value       = local.vpc_id
}

output "subnet_id" {
  description = "The ID of the first subnet"
  value       = data.aws_subnets.default.ids[0]
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = var.create_security_group ? aws_security_group.this[0].id : ""
}