variable "config_bucket_name" {
  description = "Name of the S3 bucket for AWS Config"
  type        = string
}

variable "sns_topic_name" {
  description = "Name of the SNS topic for AWS Config notifications"
  type        = string
  default     = "aws-config-notifications"
}

variable "config_role_name" {
  description = "Name of the IAM role for AWS Config"
  type        = string
  default     = "aws-config-role"
}

variable "delivery_channel_name" {
  description = "Name of the Config delivery channel"
  type        = string
  default     = "aws-config-delivery-channel"
}

variable "recorder_name" {
  description = "Name of the Config configuration recorder"
  type        = string
  default     = "aws-config-recorder"
}

variable "required_tags" {
  description = "List of required tags to check for compliance"
  type        = list(string)
  default     = ["Name", "Environment", "Owner", "Project"]
  
  validation {
    condition = alltrue([
      for tag in var.required_tags : can(regex("^[a-zA-Z0-9+\\-=._:/@]+$", tag)) && length(tag) <= 128
    ])
    error_message = "Tag names must contain only alphanumeric characters, spaces, and the following characters: + - = . _ : / @, and must be 128 characters or less."
  }
}