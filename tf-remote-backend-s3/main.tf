terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.30.0"
    }
  }
  backend "s3" {
    bucket = "tf-backend"
    key    = "workspaces"
    region = "us-east-1"
    profile = "aws-personal"
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "aws-personal"
}

output "simple_output" {
  description = "Simple output"
  value = "We are working in ${terraform.workspace} environment"
}
