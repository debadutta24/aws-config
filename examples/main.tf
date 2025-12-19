terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Use the AWS Config module
module "aws_config" {
  source = "../"

  config_bucket_name = "my-aws-config-bucket-${random_id.bucket_suffix.hex}"
  sns_topic_name     = "aws-config-notifications"
  required_tags      = ["Name", "Environment", "Owner", "RequestedBy"]
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Example resources to be monitored by Config
resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "myapp-dev-us-east-1"
    Environment = "dev"
    Owner       = "team-alpha"
    Project     = "config-demo"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name        = "webapp-dev-us-east-1"
    Environment = "dev"
    Owner       = "team-alpha"
    Project     = "config-demo"
  }
}

