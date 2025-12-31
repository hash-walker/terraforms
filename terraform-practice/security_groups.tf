# security groups 

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "allow traffic from anywhere to the website"
  vpc_id      = aws_vpc.my-vpc.id

  # inbound: ssh from anywhere

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # inbound: HTTP (80) from anywhere

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound: all traffic allowed

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "terraforms-Public-SG"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "allow traffic from  the website only"
  vpc_id      = aws_vpc.my-vpc.id

  # inbound: ssh from anywhere

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  # inbound: HTTP (80) from anywhere

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  # Outbound: all traffic allowed

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "terraforms-Private-SG"
  }
}
