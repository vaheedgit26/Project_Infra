variable "tf_state_bucket" {
  default = ""  # empty default
}

variable "aws_region" {
  default = ""  # empty default
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = var.tf_state_bucket != "" ? var.tf_state_bucket : env.TF_STATE_BUCKET
    key    = "vpc/terraform.tfstate"
    region = var.aws_region != "" ? var.aws_region : env.AWS_REGION
  }
}
