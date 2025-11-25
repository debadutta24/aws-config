# AWS Config Terraform Module

This module creates AWS Config resources including S3 bucket, SNS topic, IAM roles, and configuration rules for monitoring AWS resources and tag compliance.

## Features

- S3 bucket for Config data storage with proper IAM policies
- SNS topic for Config notifications
- IAM role with necessary permissions for Config service
- Configuration recorder to track all AWS resources
- Config rules for required tags validation
- Config rule for S3 bucket public access prohibition

## Usage

```hcl
module "aws_config" {
  source = "./aws-config"

  config_bucket_name = "my-config-bucket-unique-name"
  sns_topic_name     = "aws-config-notifications"
  required_tags      = ["Environment", "Owner", "Project"]
}
```

## Requirements

- Terraform >= 1.0
- AWS Provider >= 5.0

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| config_bucket_name | Name of the S3 bucket for AWS Config | string | n/a | yes |
| sns_topic_name | Name of the SNS topic for AWS Config notifications | string | "aws-config-notifications" | no |
| config_role_name | Name of the IAM role for AWS Config | string | "aws-config-role" | no |
| delivery_channel_name | Name of the Config delivery channel | string | "aws-config-delivery-channel" | no |
| recorder_name | Name of the Config configuration recorder | string | "aws-config-recorder" | no |
| required_tags | List of required tags to check for compliance | list(string) | ["Environment", "Owner", "Project"] | no |

## Outputs

| Name | Description |
|------|-------------|
| config_bucket_name | Name of the Config S3 bucket |
| config_bucket_arn | ARN of the Config S3 bucket |
| sns_topic_arn | ARN of the Config SNS topic |
| config_role_arn | ARN of the Config IAM role |
| delivery_channel_name | Name of the Config delivery channel |
| recorder_name | Name of the Config configuration recorder |

## Example

See the `examples/` directory for a complete example that demonstrates:
- Setting up AWS Config
- Creating compliant resources with proper tags
- Creating non-compliant resources to test Config rules