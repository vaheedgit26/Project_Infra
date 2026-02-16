#!/bin/bash
###########################################################
# Usage: source create-s3-bucket.sh expense dev ap-south-1
# NOTE: Use 'source' to keep TF_VARs in current shell
###########################################################
set -e

PROJECT_NAME=$1
ENV=$2
REGION=$3

if [[ -z "$PROJECT_NAME" || -z "$ENV" || -z "$REGION" ]]; then
    echo "Usage: source create-s3-bucket.sh <project_name> <env> <region>"
    return 1
fi

echo "============================================="
echo "Step 1: Create S3 bucket for Terraform state "
echo "============================================="

terraform init

echo "===================================================="
echo "Step 2: Checking S3 bucket Configuration Validity"
echo "===================================================="
terraform validate

echo "================================================"
echo "Step 3: Generating plan for creating S3 bucket"
echo "================================================"
terraform plan \
  -out=s3.tfplan \
  -var="project_name=$PROJECT_NAME" \
  -var="env=$ENV" \
  -var="region=$REGION"

echo "================================================"
echo "Step 4: Applying plan for creating S3 bucket"
echo "================================================"
terraform apply s3.tfplan    # Add -auto-approve if you want no prompt

echo "================================================"
echo "Step 5: Exporting TF_VARs for current shell"
echo "================================================"

# Capture Terraform outputs
TF_VAR_env=$(terraform output -raw env)
TF_VAR_region=$(terraform output -raw region)
TF_VAR_tf_state_bucket=$(terraform output -raw tfstate_bucket_id)

# Export variables to current shell
export TF_VAR_env
export TF_VAR_region
export TF_VAR_tf_state_bucket

# Print instructions for user confirmation
echo "================================================"
echo "✅ TF_VARs exported for current shell:"
echo "TF_VAR_env=$TF_VAR_env"
echo "TF_VAR_region=$TF_VAR_region"
echo "TF_VAR_tf_state_bucket=$TF_VAR_tf_state_bucket"
echo "You can now run Terraform commands with these variables."
echo "================================================"
