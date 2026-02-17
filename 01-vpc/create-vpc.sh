################################################
# Usage: sh create-vpc.sh <project_name> <env> #
################################################

#!/bin/bash
set -e

BUCKET=$(terraform -chdir=../s3 output -raw bucket)                 #${TF_VAR_tf_state_bucket}
ENV=$(terraform -chdir=../s3 output -raw env)                       #${TF_VAR_env}
REGION=$(terraform -chdir=../s3 output -raw region)                 #${TF_VAR_region}

# Step 0: Go to repo root
# cd "$(dirname "$0")"

echo "============================================="
echo "Step 1: Initialiaze VPC Module "
echo "============================================="
# cd 0-s3

terraform init \
  -backend-config="bucket=${BUCKET}" \
  -backend-config="key=${ENV}/vpc/terraform.tfstate" \
  -backend-config="region=${REGION}" \
  -backend-config="encrypt=true" \
  -backend-config="use_lockfile=true"


echo "===================================================="
echo "Step 2: Checking VPC Configuration Validity ? "
echo "===================================================="
terraform validate

echo "================================================"
echo "Step 3: Generating plan for creating VPC  "
echo "================================================"
terraform plan

echo "================================================"
echo "Step 4: Applying plan for creating S3 bucket  "
echo "================================================"
terraform apply # -auto-approve
