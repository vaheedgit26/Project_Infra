variable "region" {}

variable "common_tags" {
  default = {
    Project     = "org"
    Environment = "dev"
    Terraform   = "true"
  }
}
