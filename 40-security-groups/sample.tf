module "sample_sg" {
  source         = "git::https://github.com/vaheedgit26/Infra.git//modules/sg"
  vpc_id         = data.terraform_remote_state.vpc.outputs.vpc_id    # from 'data-remote.tf' file
  sg_name        = "web_alb_sg"
  sg_description = "Web ALB Security Group"

  project_name = var.project_name
  env          = var.env
  common_tags  = var.common_tags
}

