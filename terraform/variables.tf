variable "aws_region" {
  description = "Default AWS Region"
  default = "us-east-1"
}

variable "public_key_path" {
  default = "~/.ssh/test-docker-ce.pub"
}

variable "aws_key_name" {
  default = "test-docker-ce"
}

variable "connection_timeout" {
  default = "120s"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default = "10.0.0.0/16"
}

variable "test-docker-ce_subnet_cidr" {
  description = "CIDR for the Docker CE Test Public Subnet"
  default = "10.0.5.0/24"
}

variable "aws_amis_base" {
  description = "aws-us-east-1 Ubuntu 16.04 LTS w/ Docker version 17.09.0-ce"
  default = {
    us-east-1 = "ami-d9dd1fa3"
  }
}

variable "owner" {
  description = "Infrastructure Owner"
  default = "Gary Stafford"
}

variable "environment" {
  description = "test-docker-ce Environment"
  default = "test-docker-ce"
}
