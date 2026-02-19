variable "region" {}

variable "requester_project_name" {}
variable "accepter_project_name" {}

variable "requester_project_env" {}
variable "accepter_project_env" {}

variable "common_tags" {
  default = {
    Project     = "org"
    Environment = "dev"
    Terraform   = "true"
  }
}
