output "config_bucket_name" {
  description = "Name of the Config S3 bucket"
  value       = aws_s3_bucket.config.bucket
}

output "config_bucket_arn" {
  description = "ARN of the Config S3 bucket"
  value       = aws_s3_bucket.config.arn
}

output "sns_topic_arn" {
  description = "ARN of the Config SNS topic"
  value       = aws_sns_topic.config.arn
}

output "config_role_arn" {
  description = "ARN of the Config IAM role"
  value       = aws_iam_role.config.arn
}

output "delivery_channel_name" {
  description = "Name of the Config delivery channel"
  value       = aws_config_delivery_channel.main.name
}

output "recorder_name" {
  description = "Name of the Config configuration recorder"
  value       = aws_config_configuration_recorder.main.name
}