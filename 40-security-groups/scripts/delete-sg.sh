########################################################
# Usage: bash delete-vpc.sh            #
########################################################

#!/bin/bash
set -e

BUCKET=$(terraform -chdir=../../0-s3 output -raw bucket_id)              #${TF_VAR_tf_state_bucket}
ENV=$(terraform -chdir=../../0-s3 output -raw env)                       #${TF_VAR_env}
REGION=$(terraform -chdir=../../0-s3 output -raw region)                 #${TF_VAR_region}
PROJECT_NAME=$(terraform -chdir=../../0-s3 output -raw project_name)

echo """
📄 Details:
     PROJECT_NAME : ${PROJECT_NAME}
     ENV          : ${ENV}
     REGION       : ${REGION}
     BUCKET       : ${BUCKET}
"""

cd ..

terraform destroy \
  -var="remote_bucket=${BUCKET}" \
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
