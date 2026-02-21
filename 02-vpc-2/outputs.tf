output "vpc_id" {
  value       = module.vpc-2.vpc_id
  description = "VPC ID used by EKS and other services"
}

output "public_subnet_ids" {
  value       = module.vpc-2.private_subnet_ids
  description = "Private subnets for EKS worker nodes"
}

output "private_subnet_ids" {
  value       = module.vpc-2.public_subnet_ids
  description = "Public subnets for ALB, NLB, etc."
}

output "database_subnet_ids" {
  value       = module.vpc-2.database_subnet_ids
  description = "Public subnets for ALB, NLB, etc."
}
