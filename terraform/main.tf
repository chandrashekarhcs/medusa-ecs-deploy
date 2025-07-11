terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "ap-south-1" # Mumbai region — you can change to your preferred region
}

# VPC Module (Public Subnets + NAT)
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.2"

  name = "medusa-vpc"
  cidr = "10.0.0.0/16"

  azs            = ["ap-south-1a", "ap-south-1b"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  # ✅ Important: Explicitly disable NAT and private subnets
  enable_nat_gateway     = false
  single_nat_gateway     = false
  private_subnets        = []  # explicitly set empty to avoid internal module logic
  enable_dns_hostnames   = true
  enable_dns_support     = true

  tags = {
    Name    = "medusa-vpc"
    Project = "Medusa-on-ECS"
  }
}
