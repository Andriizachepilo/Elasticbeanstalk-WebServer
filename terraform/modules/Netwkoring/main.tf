resource "aws_vpc" "elastic_beanstalk_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.dns_support
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_cidr_block)

  vpc_id            = aws_vpc.elastic_beanstalk_vpc.id
  availability_zone = var.availability_zone[count.index]
  cidr_block        = var.public_cidr_block[count.index]

  tags = {
    Name = "Public subnet ${count.index + 1}"
  }

}

resource "aws_subnet" "private_subnets" {
  count = length(var.private_cidr_block)

  vpc_id            = aws_vpc.elastic_beanstalk_vpc.id
  availability_zone = var.availability_zone[count.index]
  cidr_block        = var.private_cidr_block[count.index]

  tags = {
    Name = "Private subnet ${count.index + 1}"
  }
}


resource "aws_internet_gateway" "eb_igw" {
  vpc_id = aws_vpc.elastic_beanstalk_vpc.id

  tags = {
    Name = "Internet gateway"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.elastic_beanstalk_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eb_igw.id
  }

}

resource "aws_route_table_association" "public_route_table_association" {
  count          = length(var.public_cidr_block)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id

}

resource "aws_eip" "elastic_ip" {
  count = var.associate_public_address? 1 : 0

  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  count = var.associate_public_address? 1 : 0

  allocation_id = aws_eip.elastic_ip[0].id
  subnet_id = aws_subnet.public_subnets[2].id
}

resource "aws_route_table" "private_route_table" {
  count = var.associate_public_address? 1 : 0

  vpc_id = aws_vpc.elastic_beanstalk_vpc.id

  route  {
    cidr_block ="0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway[0].id
  }
}

resource "aws_route_table_association" "private_route_table_association" {
  count = var.associate_public_address? length(var.private_cidr_block) : 0

  subnet_id = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_table[0].id
}

