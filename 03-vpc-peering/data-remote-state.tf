# --------------------------------------------------------------------
# Reference the Remote State from VPC Project
# --------------------------------------------------------------------
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = var.remote_bucket                        # Name of the remote S3 bucket where the VPC state is stored
    key    = "${var.env}/vpc/terraform.tfstate"       # Path to the VPC tfstate file within the bucket
    region = var.region                               # Region where the S3 bucket and DynamoDB table exist
  }
}

# --------------------------------------------------------------------
# Reference the Remote State from VPC Project
# --------------------------------------------------------------------
data "terraform_remote_state" "vpc-2" {
  backend = "s3"

  config = {
    bucket = var.remote_bucket                          # Name of the remote S3 bucket where the VPC state is stored
    key    = "${var.env}/vpc-2/terraform.tfstate"       # Path to the VPC tfstate file within the bucket
    region = var.region                                 # Region where the S3 bucket and DynamoDB table exist
  }
}
