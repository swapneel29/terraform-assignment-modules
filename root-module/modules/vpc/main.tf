resource "aws_vpc" "vpc1" {
  cidr_block       = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "vpc1-assignment2"
  }
}

data "aws_availability_zones" "all" {}

resource "aws_subnet" "publicsn1-1a" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.subnet1_cidr
  availability_zone = data.aws_availability_zones.all.names[0]

  tags = {
    Name = "Publicsn1-assignment2"
  
}
}

resource "aws_internet_gateway" "vpc1_ig1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "IG1-assignment2"
  }
}

resource "aws_route_table" "publicrt" {
    vpc_id = aws_vpc.vpc1.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.vpc1_ig1.id
    }

    tags = {
        Name = "Public RouteTable - assignment2"
    }
}

resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.publicsn1-1a.id
    route_table_id = aws_route_table.publicrt.id
}

resource "aws_security_group" "sg1" {
  name = "security-group1"
  vpc_id = aws_vpc.vpc1.id

  # Allow all outbound 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # Inbound for Web server
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}