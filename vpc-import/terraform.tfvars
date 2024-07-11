#----------------------------------------------------
# VPC VARIABLES
#----------------------------------------------------
create_internet_gateway = true

flow_log_format    = "$${version} $${vpc-id} $${subnet-id} $${instance-id} $${interface-id} $${account-id} $${type} $${srcaddr} $${dstaddr} $${srcport} $${dstport} $${pkt-srcaddr} $${pkt-dstaddr} $${protocol} $${bytes} $${packets} $${start} $${end} $${action} $${tcp-flags} $${log-status}"
flow_log_retention = "30"

#----------------------------------------------------
# SUBNET VARIABLES
#----------------------------------------------------
private_subnets = {
  "Dev VR Mgmt A" = {
    cidr_block        = "172.32.236.16/28"
    availability_zone = "a"
    rt_association    = "OEA-Dev-VPC_VR-Mgmt"
  }
}

public_subnets = {
  "Dev Web Tier A" = {
    cidr_block        = "172.32.1.0/24"
    availability_zone = "a"
    rt_association    = "Dev Web Route"
  }
}
#----------------------------------------------------
# ROUTE TABLE VARIABLES
#----------------------------------------------------
route_tables = [
  "Dev Web Route",
  "OEA-Dev-VPC_VR-Mgmt"
]

tags = {
  internet_gateway = {
    Name = "Test IGW"
  },
  vpc = {
    Name = "Test VPC"
  },
  flow_logs = {
    Name = "Testing_Flow_Logs"
  }
}

vpc = {
  cidr_block           = "172.32.0.0/16"
  enable_dns_hostnames = true
}
