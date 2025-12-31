# public subnet 1

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.public_subnet_cidr_1
  availability_zone = "us-east-1a"

  tags = {
    Name = var.public_subnet_name_1
  }
}

# private subnet 1

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_subnet_cidr_1
  availability_zone = "us-east-1a"

  tags = {
    Name = var.private_subnet_name_1
  }
}


# public subnet 2

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.public_subnet_cidr_2
  availability_zone = "us-east-1b"

  tags = {
    Name = var.public_subnet_name_2
  }
}

# private subnet 

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_subnet_cidr_2
  availability_zone = "us-east-1b"

  tags = {
    Name = var.private_subnet_name_2
  }
}

# rotue tables public 1 and 2

resource "aws_route_table" "public_RT_1" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public_RT_1"
  }
}

resource "aws_route_table" "public_RT_2" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public_RT_2"
  }
}

# public subnet association

resource "aws_route_table_association" "public_subnet_assoc_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_RT_1.id
}

resource "aws_route_table_association" "public_subnet_assoc_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_RT_2.id
}


# route tables private 1 and 2

resource "aws_route_table" "private_RT_1" {
  vpc_id = aws_vpc.my-vpc.id

  # All internet traffic (0.0.0.0/0) goes through NAT
  /*
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_1.id
  }
  */

  tags = {
    Name = "private_RT_1"
  }
}

resource "aws_route_table" "private_RT_2" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "private_RT_2"
  }
}

# private subnet association

resource "aws_route_table_association" "private_subnet_assoc_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_RT_1.id
}

resource "aws_route_table_association" "private_subnet_assoc_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_RT_2.id
}
