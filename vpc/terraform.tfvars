#----------------------------------------------------
# VPC VARIABLES
#----------------------------------------------------
create_internet_gateway = true
dhcp_options = {
  dhcp_options_name   = "test-dhcp-options"
  domain_name         = "region.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
}
#----------------------------------------------------
# FLOW LOG VARIABLES
#----------------------------------------------------
flow_log_format    = "$${version} $${vpc-id} $${subnet-id} $${instance-id} $${interface-id} $${account-id} $${type} $${srcaddr} $${dstaddr} $${srcport} $${dstport} $${pkt-srcaddr} $${pkt-dstaddr} $${protocol} $${bytes} $${packets} $${start} $${end} $${action} $${tcp-flags} $${log-status}"
flow_log_retention = "30"
kms_key_id         = null

nat_gateway_configurations = {
  "Dev NAT Gateway A" = {
    subnet = "Dev NAT Gateway A"
  }
}
#----------------------------------------------------
# SUBNET VARIABLES
#----------------------------------------------------
private_subnets = {
  "Dev VR Mgmt A" = {
    cidr_block        = "172.32.236.16/28"
    availability_zone = "a"
    rt_association    = "OEA-Dev-VPC_VR-Mgmt"
  },
  "Dev App Tier A" = {
    cidr_block        = "172.32.2.0/24"
    availability_zone = "a"
    rt_association    = "Dev Int. App Route"
  },
  "Dev App Tier B" = {
    cidr_block        = "172.32.5.0/24"
    availability_zone = "b"
    rt_association    = "Dev Int. App Route"
  },
  "Dev Data Tier A" = {
    cidr_block        = "172.32.3.0/24"
    availability_zone = "a"
    rt_association    = "Dev Int. DB Route"
  },
  "Dev Data Tier B" = {
    cidr_block        = "172.32.6.0/24"
    availability_zone = "b"
    rt_association    = "Dev Int. DB Route"
  }
}

public_subnets = {
  "Dev Web Tier A" = {
    cidr_block        = "172.32.1.0/24"
    availability_zone = "a"
    rt_association    = "Dev Web Route"
  },
  "Dev Web Tier B" = {
    cidr_block        = "172.32.4.0/24"
    availability_zone = "b"
    rt_association    = "Dev Web Route"
  },
  "Dev NAT Gateway A" = {
    cidr_block        = "172.32.7.0/28"
    availability_zone = "a"
    rt_association    = "Dev NAT Gateway Route Table"
  },
  "Dev NAT Gateway B" = {
    cidr_block        = "172.32.8.0/28"
    availability_zone = "b"
    rt_association    = "Dev NAT Gateway Route Table"
  }
}
#----------------------------------------------------
# ROUTE TABLE VARIABLES
#----------------------------------------------------
route_tables = [
  "Dev Web Route",
  "OEA-Dev-VPC_VR-Mgmt",
  "Dev Int. App Route",
  "Dev NAT Gateway Route Table",
  "Dev Int. DB Route"
]

routes = {
  igw = {
    "Dev Web Route" = {
      destination = "0.0.0.0/0"
    },
    "Dev NAT Gateway Route Table" = {
      destination = "0.0.0.0/0"
    }
  },
  nat_gateway = {
    "Dev Int. App Route" = {
      nat_gateway_name = "Dev NAT Gateway A"
      destination      = "0.0.0.0/0"
    },
    "Dev Int. DB Route" = {
      nat_gateway_name = "Dev NAT Gateway A"
      destination      = "0.0.0.0/0"
    }
  }
}

tags = {
  internet_gateway = {
    Name = "DEV IGW (Picard)"
  },
  vpc = {
    Name = "OEA Dev VPC"
  },
  dhcp_options = {
    Name = "dev-new-04012021"
  },
  flow_logs = {
    Name = "OEA_Dev_VPC_Flow_Logs"
  }
}

vpc = {
  cidr_block           = "172.32.0.0/16"
  enable_dns_hostnames = true
}
