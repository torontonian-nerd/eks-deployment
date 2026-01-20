# Terraform Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #   version = ">= 6.4"
    }
  }
}

# Provider Block
provider "aws" {
  region = "ca-central-1"
}