locals {
  requester_vpc_id  =  data.aws_ssm_parameter.requester_vpc_id.value
  accepter_vpc_id   =  data.aws_ssm_parameter.accepter_vpc_id.value
}
