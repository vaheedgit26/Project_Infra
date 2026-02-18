#############################   Common Variables   #########################################
variable "project_name" { default = "expense" }
variable "env" { default = "dev" }
variable "remote_bucket" {}

variable "common_tags" {
  default = {
    Project     = "expense"
    Environment = "dev"
    Terraform   = "true"
  }
}
#############################################################################################
