#--------------------------------------------------
# VPC
#--------------------------------------------------
module "vpc" {
  source  = "app.terraform.io/dmk-tfc-setup-sandbox/vpc/aws"
  version = "0.0.7"

  create_internet_gateway = var.create_internet_gateway
  flow_log_format         = var.flow_log_format
  flow_log_role_arn       = module.flow_log_role.role_arn
  flow_log_retention      = var.flow_log_retention
  private_subnets         = var.private_subnets
  public_subnets          = var.public_subnets
  route_tables            = var.route_tables
  routes                  = {}
  vpc                     = var.vpc
  tags                    = var.tags
}
#--------------------------------------------------
# FLOW LOG ROLE AND POLICY
#--------------------------------------------------
module "flow_log_role" {
  source  = "app.terraform.io/dmk-tfc-setup-sandbox/iam-role/aws"
  version = "0.0.4"

  description               = local.flow_log_role.role_description
  custom_managed_policy_arn = [module.flow_log_policy.policy_arn]
  name                      = local.flow_log_role.role_name
  path                      = local.flow_log_role.role_path
  trust_relationship        = local.flow_log_role.trust_relationship
}

module "flow_log_policy" {
  source  = "app.terraform.io/dmk-tfc-setup-sandbox/iam-policy/aws"
  version = "0.0.4"

  description = local.flow_log_policy.policy_description
  name        = local.flow_log_policy.policy_name
  path        = local.flow_log_policy.policy_path
  statements  = local.flow_log_policy.statements
}