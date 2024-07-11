#--------------------------------------------------
# AWS Variables
#--------------------------------------------------

variable "aws_region" {
  description = "The AWS region to deploy the resources into."
  type        = string
  default     = "us-east-1"
}

variable "create_internet_gateway" {
  description = "A boolean flag to enable/disable an Internet Gateway."
  type        = bool
}

variable "flow_log_format" {
  description = "The format of the flow log record."
  type        = string
}

variable "flow_log_retention" {
  description = "The number of days to retain VPC Flow Logs."
  type        = string
}

variable "private_subnets" {
  description = "Configuration for subnets."
  type = map(object({
    availability_zone = string
    cidr_block        = string
    rt_association    = string
  }))
}

variable "public_subnets" {
  description = "Configuration for subnets."
  type = map(object({
    availability_zone = string
    cidr_block        = string
    rt_association    = string
  }))
}

variable "route_tables" {
  description = "The names of the route tables to create."
  type        = list(string)
}

variable "tags" {
  description = "Resource tags."
  type = object({
    internet_gateway = map(string)
    vpc              = map(string)
    flow_logs        = map(string)
  })
}

variable "vpc" {
  description = "Configuration for the VPC."
  type = object({
    cidr_block           = string
    enable_dns_hostnames = bool
  })
}

#--------------------------------------------------
# DEFAULT TAGS
#--------------------------------------------------

variable "application" {
  type    = string
  default = "network-infrastructure"
}

variable "environment" {
  type    = string
  default = "testing"
}

variable "owner" {
  type    = string
  default = "devops"
}

variable "tfc_project" {
  type    = string
  default = "network"
}

locals {
  tfc_workspace = "${var.environment}-${var.tfc_project}-${var.aws_region}"
  cost_center   = "${var.environment}-${var.tfc_project}"
}
