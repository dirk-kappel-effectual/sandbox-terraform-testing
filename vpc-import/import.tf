#--------------------------------------------------
# ROUTE TABLES
#--------------------------------------------------

import {
  id = "rtb-0497e203b6c1c1cd5"
  to = module.vpc.aws_route_table.this["OEA-Dev-VPC_VR-Mgmt"]
}

import {
  id = "rtb-0718eda9772de4e46"
  to = module.vpc.aws_route_table.this["Dev Web Route"]
}

#--------------------------------------------------
# ROUTE TABLE ASSOCIATIONS
#--------------------------------------------------

import {
  # subnet_id/route_table_id
  id = "subnet-046fd9e805e14d129/rtb-0497e203b6c1c1cd5"
  to = module.vpc.aws_route_table_association.private["Dev VR Mgmt A"]
}

import {
  # subnet_id/route_table_id
  id = "subnet-0e517468e1fa12f6f/rtb-0718eda9772de4e46"
  to = module.vpc.aws_route_table_association.public["Dev Web Tier A"]
}


#--------------------------------------------------
# SUBNETS 
#--------------------------------------------------

import {
  id = "subnet-046fd9e805e14d129"
  to = module.vpc.aws_subnet.private["Dev VR Mgmt A"]
}

import {
  id = "subnet-0e517468e1fa12f6f"
  to = module.vpc.aws_subnet.public["Dev Web Tier A"]
}

#--------------------------------------------------
# VPC
#--------------------------------------------------

import {
  # internet_gateway_id
  id = "igw-0cfd05b4abd6d384b"
  to = module.vpc.aws_internet_gateway.this[0]
}

import {
  id = "vpc-01ce21853d4406c6e"
  to = module.vpc.aws_vpc.this
}

#--------------------------------------------------
# FLOW LOGS
#--------------------------------------------------

import {
  id = "arn:aws:iam::725857994970:policy/testing/flow-logs-testing-vpc"
  to = module.flow_log_policy.aws_iam_policy.this
}

import {
  id = "flow-logs-testing-vpc"
  to = module.flow_log_role.aws_iam_role.this
}

import {
  id = "Testing_Flow_Logs"
  to = module.vpc.aws_cloudwatch_log_group.this
}

import {
  id = "fl-0d28400244a45efca"
  to = module.vpc.aws_flow_log.this
}