####################################################
# Usage: sh create-infra.sh expense dev ap-south-1 #
####################################################

#!/bin/bash
set -e

PROJECT_NAME=$1
ENV=$2
REGION=$3

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
terraform plan -var="project_name=$PROJECT_NAME" -var="env=$ENV" -var="region=$REGION"

echo "================================================"
echo "Step 4: Applying plan for creating S3 bucket  "
echo "================================================"
terraform apply -var="project_name=$PROJECT_NAME" -var="env=$ENV" -var="region=$REGION" # -auto-approve

# Export env, AWS region and S3 bucket name as environment variables
export TF_VAR_env=$(terraform output -raw env)
export TF_VAR_region=$(terraform output -raw region)
export TF_VAR_tf_state_bucket=$(terraform output -raw tfstate_bucket_id)

echo "TF_VAR_env=$TF_VAR_env"
echo "TF_VAR_region=$TF_VAR_region"
echo "TF_VAR_tf_state_bucket=$TF_VAR_tf_state_bucket"
