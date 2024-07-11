variable "create_internet_gateway" {
  description = "A boolean flag to enable/disable an Internet Gateway."
  type        = bool
  default     = true
}

variable "dhcp_options" {
  description = "Configuration for DHCP Options Set."
  type = object({
    domain_name          = optional(string, null)
    domain_name_servers  = optional(list(string), [])
    netbios_name_servers = optional(list(string), [])
    netbios_node_type    = optional(string, null)
    ntp_servers          = optional(list(string), [])
  })
  default = null
}

variable "flow_log_format" {
  description = "The fields to include in the flow log record, in the order in which they should appear."
  type        = string
  default     = null
}

variable "flow_log_retention" {
  description = "The number of days to retain VPC Flow Logs."
  type        = string
  default     = "90"
}

variable "flow_log_role_arn" {
  description = "The ARN of the IAM role that will publish flow logs to CloudWatch Logs."
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "The ARN of the KMS key to use for encryption."
  type        = string
  default     = null
}

variable "nat_gateway_configurations" {
  description = "The subnets to create the NAT Gateway in."
  type = map(object({
    subnet = string
  }))
  default = {}
}

variable "private_subnets" {
  description = "Configuration for subnets."
  type = map(object({
    availability_zone = optional(string, null)
    cidr_block        = string
    tags              = optional(map(string), {})
    rt_association    = optional(string, null)
  }))
}

variable "public_subnets" {
  description = "Configuration for subnets."
  type = map(object({
    availability_zone  = optional(string, null)
    cidr_block         = string
    create_nat_gateway = optional(bool, false)
    tags               = optional(map(string), {})
    rt_association     = optional(string, null)
  }))
}

variable "routes" {
  description = "Route configurations"
  type = object({
    igw = optional(map(object({
      destination = string
    })), {})
    nat_gateway = optional(map(object({
      nat_gateway_name = string
      destination      = string
    })), {})
  })
}

variable "route_tables" {
  description = "The names of the route tables to create."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Resource tags."
  type = object({
    internet_gateway = optional(map(string), {})
    vpc              = optional(map(string), {})
    dhcp_options     = optional(map(string), {})
    flow_logs        = optional(map(string), {})
  })
  default = {}
}

variable "vpc" {
  description = "Configuration for the VPC."
  type = object({
    cidr_block           = string
    enable_dns_support   = optional(bool, true)
    enable_dns_hostnames = optional(bool, false)
  })
}
