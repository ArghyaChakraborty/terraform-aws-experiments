/*
    Configure:
        aws configure --profile <profile name> (then enter access key, secret access key, region in the prompt)
        Create a S3 bucket
        Replace bucket name in terraform.backend s3.bucket 
        Replace profile name in terraform.backend s3.profile and provider aws.profile
        
    Execute:
        terraform init
        terraform workspace new dev || terraform workspace select prod
        terraform apply -auto-approve

        terraform workspace new prod || terraform workspace select prod
        terraform apply -auto-approve
    
    Observe:
        The new directories/files created in S3 bucket

*/

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
