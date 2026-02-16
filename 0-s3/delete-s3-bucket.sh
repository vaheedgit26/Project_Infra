########################################################
# Usage: sh delete-s3-bucket.sh expense dev ap-south-1 #
########################################################

#!/bin/bash
set -e

PROJECT_NAME=$1
ENV=$2
REGION=$3

# terraform init

terraform destroy \
  -var="project_name=$PROJECT_NAME" \
  -var="env=$ENV" \
  -var="region=$REGION"
  # -auto-approve
