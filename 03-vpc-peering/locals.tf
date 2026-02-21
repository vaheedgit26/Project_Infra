locals {
  requester_vpc_id  =  data.terraform_remote_state.vpc.outputs.vpc_id
  accepter_vpc_id   =  data.terraform_remote_state.vpc-2.outputs.vpc_id
}
