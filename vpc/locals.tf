#--------------------------------------------------
# FLOW LOG ROLE AND POLICY
#--------------------------------------------------
locals {
  flow_log_role = {
    role_path        = "/${var.environment}/"
    role_description = "Role to deliver flow logs to cloud watch log groups."
    role_name        = "flow-logs-${var.environment}-vpc"
    trust_relationship = {
      actions = ["sts:AssumeRole"]
      effect  = "Allow"
      principals = [
        {
          type        = "Service"
          identifiers = ["vpc-flow-logs.amazonaws.com"]
        }
      ]
    }
  }

  flow_log_policy = {
    policy_name        = "flow-logs-${var.environment}-vpc"
    policy_path        = "/${var.environment}/"
    policy_description = "Policy to allow flow logs to be delivered to cloud watch log groups."
    statements = [
      {
        effect = "Allow"
        actions = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
        ]
        resources = ["*"]
      }
    ]
  }
}