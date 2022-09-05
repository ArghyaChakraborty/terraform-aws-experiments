terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "arghya_company"

    workspaces {
      name = "terraform-experiments-cli"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.29.0"
    }
  }
}

provider "aws" {

}