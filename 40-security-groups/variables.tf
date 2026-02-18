#############################   Common Variables   #########################################
variable "region" {}
variable "project_name" {}
variable "env" {}
variable "remote_bucket" {}

variable "common_tags" {
  default = {
    Project     = "expense"
    Environment = "dev"
    Terraform   = "true"
  }
}
#############################################################################################
