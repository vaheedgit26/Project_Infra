############### If you want 1 az, 1 public subnet, 1 private subnet and 1 database subnet ########################
 module "vpc-2" {
   source = "git::https://github.com/vaheedgit26/Infra//modules/vpc"          # Give the path to VPC MODULE accordingly

   # All the counts should be same 
   azs_count             = 1
   public_subnet_count   = 1
   private_subnet_count  = 1
   database_subnet_count = 1

   vpc_cidr             = "10.200.0.0/16"
   public_subnet_cidr   = ["10.200.1.0/24"]
   private_subnet_cidr  = ["10.200.11.0/24"]
   database_subnet_cidr = ["10.200.31.0/24"]

   project_name =  "org"                 # var.requester_project_name     
   env          =  "dev"                 # var.requester_project_env     
   common_tags  =  var.common_tags
 }
