#!/bin/bash
set -e

# Step 0: Go to repo root
# cd "$(dirname "$0")"

echo "============================================="
echo "Step 1: Create S3 bucket for Terraform state "
echo "============================================="
# cd 0-s3

terraform init

echo "===================================================="
echo "Step 2: Checking S3 bucket Configuration Validity ? "
echo "===================================================="
terraform validate

echo "================================================"
echo "Step 3: Generating plan for creating S3 bucket  "
echo "================================================"
terraform plan

echo "================================================"
echo "Step 4: Applying plan for creating S3 bucket  "
echo "================================================"
terraform apply # -auto-approve

# Export S3 bucket name and AWS region as environment variables
export TF_VAR_tf_state_bucket=$(terraform output -raw tfstate_bucket_id)
export TF_VAR_region=$(terraform output -raw region)

echo "TF_VAR_tf_state_bucket=$TF_VAR_tf_state_bucket"
echo "TF_VAR_region=$TF_VAR_region"
