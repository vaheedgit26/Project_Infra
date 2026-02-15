output "aws_region" {
  description = "AWS region"
  value       = var.region
}

output "tfstate_bucket_arn" {
  description = "ARN of the Terraform remote state S3 bucket"
  value       = module.s3.tfstate_bucket_arn
}

output "tfstate_bucket_id" {
  description = "Bucket ID (same as name) for Terraform state"
  value       = module.s3.tfstate_bucket_id
}
