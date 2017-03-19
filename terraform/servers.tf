resource "aws_security_group" "test-docker-ce" {
  name   = "security-group-test-docker-ce"
  description = "Security group for test-docker-ce"

  vpc_id = "${aws_vpc.test-docker-ce.id}"

  # Inbound from Internet for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Owner       = "${var.owner}"
    Terraform   = true
    Environment = "${var.environment}"
    Name        = "tf-security-group-test-docker-ce"
  }
}

# test-docker-ce instance
resource "aws_instance" "test-docker-ce" {
  ami               = "${lookup(var.aws_amis_base, var.aws_region)}"
  instance_type     = "t2.nano"
  availability_zone = "us-east-1a"
  count             = "1"

  key_name               = "${aws_key_pair.auth.id}"
  vpc_security_group_ids = ["${aws_security_group.test-docker-ce.id}"]
  subnet_id              = "${aws_subnet.test-docker-ce.id}"

  tags {
    Owner       = "Gary A. Stafford"
    Terraform   = true
    Environment = "test-docker-ce"
    Name        = "tf-instance-test-docker-ce"
  }
}
