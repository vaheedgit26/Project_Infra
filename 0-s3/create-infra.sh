#!/bin/bash
set -e

# Step 0: Go to repo root
# cd "$(dirname "$0")"

echo "============================================="
echo "Step 1: Create S3 bucket for Terraform state "
echo "============================================="
# cd 0-s3

terraform init

echo "================================================="
echo "Step 2: Checking S3 bucket Configuration Valid ? "
echo "================================================="
terraform validate

echo "================================================"
echo "Step 3: Generating plan for creating S3 bucket  "
echo "================================================"
terraform plan

terraform apply # -auto-approve

# Export S3 bucket name and AWS region as environment variables
export TF_STATE_BUCKET=$(terraform output -raw tfstate_bucket_id)
export AWS_REGION=$(terraform output -raw aws_region)

echo "TF_STATE_BUCKET=$TF_STATE_BUCKET"
echo "AWS_REGION=$AWS_REGION"
