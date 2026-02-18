########################################################
# Usage: bash delete-vpc.sh expense dev      #
########################################################

#!/bin/bash
set -e

BUCKET=$(terraform -chdir=../../0-s3 output -raw bucket_id)              #${TF_VAR_tf_state_bucket}
ENV=$(terraform -chdir=../../0-s3 output -raw env)                       #${TF_VAR_env}
REGION=$(terraform -chdir=../../0-s3 output -raw region)                 #${TF_VAR_region}
PROJECT_NAME=$(terraform -chdir=../../0-s3 output -raw project_name)

# terraform init

cd ..

terraform destroy \
  -var="bucket=${BUCKET}" \
  -var="project_name=$PROJECT_NAME" \
  -var="env=$ENV" \
  -var="region=$REGION"
  # -auto-approve


# terraform plan -destroy \
#  -var="project_name=expense" \
#  -var="env=dev" \
#  -var="region=ap-south-1" \
#  -out=destroy.tfplan

# terraform apply destroy.tfplan
