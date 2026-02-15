bucket         = "tfstate-dev-us-east-1-jpjtof"
# key            = "dev/vpc/terraform.tfstate"
region         = "ap-south-1"
encrypt        = true
use_lockfile   = true


# terraform init \
#   -backend-config=../backend-configs/dev.hcl \
#   -backend-config="key=vpc/terraform.tfstate"   (This should be passed according to your module like vpc, alb, sg ...etc

