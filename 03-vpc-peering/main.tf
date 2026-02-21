module "vpc-peering" {
  source = "git::https://github.com/vaheedgit26/Infra//modules/vpc-peering"   # Give the path to VPC MODULE accordingly

  region                       =  var.region
  requester_vpc_id             =  local.requester_vpc_id                       
  accepter_vpc_id              =  local.accepter_vpc_id                        
}
