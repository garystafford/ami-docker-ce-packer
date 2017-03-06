# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "test-docker-ce" {
  vpc_id = "${aws_vpc.test-docker-ce.id}"

  tags {
    Owner       = "${var.owner}"
    Terraform   = true
    Environment = "${var.environment}"
    Name        = "tf-internet-gateway-test-docker-ce"
  }
}

# Grant the VPC internet access on its main route table
resource "aws_route" "test-docker-ce" {
  route_table_id         = "${aws_vpc.test-docker-ce.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.test-docker-ce.id}"
}

# Create a public subnet for test-docker-ce instances
resource "aws_subnet" "test-docker-ce" {
  vpc_id                  = "${aws_vpc.test-docker-ce.id}"
  cidr_block              = "${var.test-docker-ce_subnet_cidr}"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags {
    Owner       = "${var.owner}"
    Terraform   = true
    Environment = "${var.environment}"
    Name        = "tf-subnet-test-docker-ce"
  }
}

resource "aws_route_table" "test-docker-ce" {
    vpc_id = "${aws_vpc.test-docker-ce.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.test-docker-ce.id}"
    }

    tags {
      Owner       = "${var.owner}"
      Terraform   = true
      Environment = "${var.environment}"
      Name        = "tf-route-table-test-docker-ce"
    }
}

resource "aws_route_table_association" "test-docker-ce" {
    subnet_id      = "${aws_subnet.test-docker-ce.id}"
    route_table_id = "${aws_route_table.test-docker-ce.id}"
}
