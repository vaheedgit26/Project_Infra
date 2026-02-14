# S3-MODULE Calling
module "s3" {
  source = "git::https://github.com/vaheedgit26/Infra//modules/s3"    # Give the path to S3 MODULE accordingly
  env = "dev"
  region = "ap-south-1"
}
