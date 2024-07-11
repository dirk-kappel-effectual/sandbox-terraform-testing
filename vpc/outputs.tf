output "cloud_watch_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group created by this module."
  value       = module.vpc.cloud_watch_log_group_arn
}

output "default_nacl_id" {
  description = "The ID of the default nacl created by this module."
  value       = module.vpc.default_nacl_id
}

output "default_route_table_id" {
  description = "The ID of the default route table created by this module."
  value       = module.vpc.default_route_table_id
}

output "default_security_group_id" {
  description = "The ID of the default security group created by this module."
  value       = module.vpc.default_security_group_id
}

output "dhcp_options_arn" {
  description = "The ARN of the DHCP options set created by the module."
  value       = module.vpc.dhcp_options_arn
}

output "dhcp_options_id" {
  description = "The ID of the DHCP options set created by the module."
  value       = module.vpc.dhcp_options_id
}

output "eip_allocation_ids" {
  description = "The EIP allocation IDs created by the module."
  value       = module.vpc.eip_allocation_ids
}

output "flow_log_id" {
  description = "The ID of the flow log created by this module."
  value       = module.vpc.flow_log_id
}

output "internet_gateway_arn" {
  description = "The ARN of the internet gateway created by the module."
  value       = module.vpc.internet_gateway_arn
}

output "internet_gateway_id" {
  description = "The ID of the internet gateway created by the module."
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_ids" {
  description = "The IDs of the NAT gateways created by the module."
  value       = module.vpc.nat_gateway_ids
}

output "route_tables" {
  description = "The route tables created by the module."
  value       = module.vpc.route_tables
}

output "private_subnets" {
  description = "The private subnets created by the module."
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "The public subnets created by the module."
  value       = module.vpc.public_subnets
}

output "vpc_arn" {
  description = "The ARN of the VPC created by the module."
  value       = module.vpc.vpc_arn
}

output "vpc_id" {
  description = "The ID of the VPC created by the module."
  value       = module.vpc.vpc_id
}

# # --------------------------------------------------
# # VPC ENDPOINTS
# # --------------------------------------------------

# output "vpce_gateway_endpoints" {
#   description = "A map of the gateway VPC endpoints created."
#   value       = module.vpc_endpoints.gateway_endpoints
# }

# output "vpce_interface_endpoints" {
#   description = "A map of the interface VPC endpoints created."
#   value       = module.vpc_endpoints.interface_endpoints
# }

# #--------------------------------------------------
# # SECURITY GROUPS
# #--------------------------------------------------

# output "vpce_security_group_id" {
#   description = "The ID of the security group created for the VPC endpoint."
#   value       = module.security_groups_vpce.security_group_id
# }

# output "vpce_security_group_arn" {
#   description = "The ARN of the security group created for the VPC endpoint."
#   value       = module.security_groups_vpce.security_group_arn
# }

# #--------------------------------------------------
# # APPLICATION LOAD BALANCER
# #--------------------------------------------------

# output "alb_arn" {
#   description = "The ARN of the application load balancer created by the module."
#   value       = module.application_load_balancer.lb_arn
# }

# output "alb_dns_name" {
#   description = "The DNS name of the application load balancer created by the module."
#   value       = module.application_load_balancer.lb_dns_name
# }

# output "alb_zone_id" {
#   description = "The zone ID of the application load balancer created by the module."
#   value       = module.application_load_balancer.lb_zone_id
# }

# #--------------------------------------------------
# # NETWORK LOAD BALANCER
# #--------------------------------------------------

# output "nlb_arn" {
#   description = "The ARN of the network load balancer created by the module."
#   value       = module.network_load_balancer.lb_arn
# }

# output "nlb_dns_name" {
#   description = "The DNS name of the network load balancer created by the module."
#   value       = module.network_load_balancer.lb_dns_name
# }

# output "nlb_zone_id" {
#   description = "The zone ID of the network load balancer created by the module."
#   value       = module.network_load_balancer.lb_zone_id
# }

# #--------------------------------------------------
# # ALB TARGET GROUPS
# #--------------------------------------------------

# output "alb_target_group_443_1_arn" {
#   description = "The ARN of the target group for the first secure listener on the application load balancer."
#   value       = module.alb_target_group_443_1.lb_target_group_arn
# }

# output "alb_target_group_443_2_arn" {
#   description = "The ARN of the target group for the second secure listener on the application load balancer."
#   value       = module.alb_target_group_443_2.lb_target_group_arn
# }

# output "alb_target_group_80_1_arn" {
#   description = "The ARN of the target group for the first listener on the application load balancer."
#   value       = module.alb_target_group_80_1.lb_target_group_arn
# }

# output "alb_target_group_80_2_arn" {
#   description = "The ARN of the target group for the second listener on the application load balancer."
#   value       = module.alb_target_group_80_2.lb_target_group_arn
# }

# #--------------------------------------------------
# # NLB TARGET GROUPS
# #--------------------------------------------------

# output "nlb_target_group_443_arn" {
#   description = "The ARN of the target group for the secure listener on the network load balancer."
#   value       = module.nlb_target_group_443.lb_target_group_arn
# }

# output "nlb_target_group_80_arn" {
#   description = "The ARN of the target group for the listener on the network load balancer."
#   value       = module.nlb_target_group_80.lb_target_group_arn
# }

# #--------------------------------------------------
# # FLOW LOG ROLE AND POLICY
# #--------------------------------------------------

# output "flow_log_role_arn" {
#   description = "Amazon Resource Name (ARN) specifying the role."
#   value       = module.flow_log_role.role_arn
# }

# output "flow_log_role_name" {
#   description = "Name of the role."
#   value       = module.flow_log_role.role_name
# }

# output "flow_log_role_unique_id" {
#   description = "The stable and unique string identifying the role."
#   value       = module.flow_log_role.role_unique_id
# }

# output "flow_log_policy_arn" {
#   description = "The ARN assigned by AWS to this policy."
#   value       = module.flow_log_policy.policy_arn
# }

# output "flow_log_policy_id" {
#   description = "The Policy's ID."
#   value       = module.flow_log_policy.policy_id
# }