terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.33.0"
    }
  }
  backend "s3" {
    bucket = "mariia-yakubenko-infra-terraform"
    key    = "FP-terraform/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Owner   = "${var.owner}"
      Project = "${var.project}"
    }
  }
}

module "account_lookup" {
  source = "./modules/account_lookup_module"

}

module "vpc" {
  source     = "./modules/vpc_module"
  cidr_block = var.cidr_block
  owner      = var.owner
  project    = var.project
  myip       = module.account_lookup.myip
}

module "hosts" {
  source            = "./modules/hosts_module"
  public_subnet_id  = module.vpc.public_subnet_id
  security_group_id = module.vpc.security_group_id
  latest_ami_id     = module.account_lookup.latest_ami_id
  project           = var.project
  region            = var.region

}
