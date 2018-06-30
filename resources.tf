provider "aws" {
  region = "ap-southeast-2"
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${terraform.workspace}"
  cidr = "${var.vpc_cidr}"

  azs             = "${data.aws_availability_zones.available.names}"
  public_subnets = "${var.public_subnets_cidrs}"

  enable_s3_endpoint = true

  tags = {
    Environment = "${terraform.workspace}"
  }
}
