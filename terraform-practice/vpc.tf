# vpc 
resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    name = var.vpc_name
  }
}

# internet gateway 

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = var.internet_gw
  }
}
