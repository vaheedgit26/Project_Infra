variable "region" {}
variable "project_name" {}
variable "env" {}

variable "common_tags" {
  default = {
    Project     = "org"
    Environment = "dev"
    Terraform   = "true"
  }
}
