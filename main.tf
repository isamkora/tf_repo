resource "aws_vpc" "dev-vpc" {
  cidr_block = var.cidr_blocks[0].vpc
  tags = {
    Name : var.name_tags[0].vpc
  }
}

resource "aws_subnet" "dev_subnet_pub" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = var.cidr_blocks[0].subnet-pub
  availability_zone = var.region[0].subnet1_AZ

  tags = {
    Name : var.name_tags[0].subnet-pub
  }
}

resource "aws_subnet" "dev_subnet_pri" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = var.cidr_blocks[0].subnet-pri
  availability_zone = var.region[0].subnet2_AZ

  tags = {
    Name : var.name_tags[0].subnet-pri
  }
}

resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev-vpc.id

  tags = {
    Name : var.name_tags[0].igw
  }
}

resource "aws_route_table" "dev_rt_pub" {
  vpc_id = aws_vpc.dev-vpc.id
  tags = {
    Name : var.name_tags[0].rt
  }
}
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.dev_rt_pub.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev_igw.id
}

resource "aws_route_table_association" "dev_rt_ass_pub" {
  subnet_id      = aws_subnet.dev_subnet_pub.id
  route_table_id = aws_route_table.dev_rt_pub.id
}

resource "aws_security_group" "sg_allow_tls" {
  name = ""
}


