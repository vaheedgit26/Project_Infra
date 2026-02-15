# --------------------------------------------------------------------
# Reference the Remote State from S3 Project
# --------------------------------------------------------------------
data "terraform_remote_state" "s3" {
  backend = "s3"

  config = {
    bucket = module.s3.     # Name of the remote S3 bucket where the VPC state is stored
    key    = "dev/vpc/terraform.tfstate"        # Path to the VPC tfstate file within the bucket
    region = "ap-south-1"     # var.aws_region                    # Region where the S3 bucket and DynamoDB table exist
  }
}
