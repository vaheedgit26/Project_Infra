variable "region" {}        # For privider.tf, actually for vpc creation, it takes region from provider block
variable "project_name" {}
variable "env" {}

variable "common_tags" {
  default = {
    Project     = "org"
    Environment = "dev"
    Terraform   = "true"
  }
}
