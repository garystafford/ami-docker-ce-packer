# Create a VPC to launch our instances into
resource "aws_vpc" "test-docker-ce" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags {
    Owner       = "${var.owner}"
    Terraform   = true
    Environment = "${var.environment}"
    Name        = "tf-vpc-test-docker-ce"
  }
}
