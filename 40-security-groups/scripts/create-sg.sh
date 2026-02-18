################################################
# Usage: bash create-sg.sh    #
################################################
# This script takes 'bucket', 'env', region' and 'project_name' as inputs from previous '0-s3' calling module 

#!/usr/bin/env bash
set -e

BUCKET=$(terraform -chdir=../0-s3 output -raw bucket_id)              #${TF_VAR_tf_state_bucket}
ENV=$(terraform -chdir=../0-s3 output -raw env)                       #${TF_VAR_env}
REGION=$(terraform -chdir=../0-s3 output -raw region)                 #${TF_VAR_region}
PROJECT_NAME=$(terraform -chdir=../0-s3 output -raw project_name)

echo """
📄 Details:
     PROJECT_NAME : ${PROJECT_NAME}
     ENV          : ${ENV}
     REGION       : ${REGION}
     BUCKET       : ${BUCKET}
"""

# Step 0: Go to repo root
# cd "$(dirname "$0")"

echo "============================================="
echo "Step 1: Initialiaze SG Module "
echo "============================================="
# Switch to SG directory
cd ..

terraform init -upgrade \
  -backend-config="bucket=${BUCKET}" \
  -backend-config="key=${ENV}/sg/terraform.tfstate" \
  -backend-config="region=${REGION}" \
  -backend-config="encrypt=true" \
  -backend-config="use_lockfile=true"

echo "===================================================="
echo "Step 2: Checking SG Configuration Validity ? "
echo "===================================================="
terraform validate

echo "================================================"
echo "Step 3: Generating plan for creating SG  "
echo "================================================"
terraform plan \
  -out=sg.tfplan \
  -var="remote_bucket=${BUCKET}" \
  -var="project_name=$PROJECT_NAME" \
  -var="env=$ENV" 
  #-var="region=$REGION"
  
echo "================================================"
echo "Step 4: Applying plan for creating vpc bucket  "
echo "================================================"
terraform apply sg.tfplan    # -auto-approve
