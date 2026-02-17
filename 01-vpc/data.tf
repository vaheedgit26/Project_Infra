data "aws_ssm_parameter" "tfstate_bucket" {
  name = "/tfstate_bucket/${var.s3_bucket_name}"
}
