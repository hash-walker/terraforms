# create EC2 instance for web 1 and web 2

resource "aws_instance" "ec2_web_1" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  subnet_id                   = aws_subnet.public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  key_name = aws_key_pair.terraforms_key.key_name

  # --- WEB SERVER 1 ---
  user_data = <<-EOF
    #!/bin/bash
    
    # --- WEB SERVER (Apache) ---
    # Requirement: "configure one for hosting a simple web server such as Apache"
    apt-get update -y
    apt-get install apache2 -y
    
    # Enable necessary modules for proxying to backend
    a2enmod proxy
    a2enmod proxy_http
    a2enmod rewrite
    
    systemctl enable apache2
    systemctl start apache2
    
    # Allow ubuntu user to write to web dir (for deployment)
    chown -R ubuntu:ubuntu /var/www/html
    chmod -R 755 /var/www/html

    # Install Docker
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    usermod -aG docker ubuntu
    
    EOF

  tags = {
    Name = var.ec2_frontend_1_name
  }
}

/*
resource "aws_instance" "ec2_private_1" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  subnet_id                   = aws_subnet.private_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.db_sg.id]
  associate_public_ip_address = false

  key_name = aws_key_pair.terraforms_key.key_name

  user_data = <<-EOF
    # --- DATABASE/ ML MODEL INSTANCE ---
    apt-get update -y
    
    # Install Docker
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    usermod -aG docker ubuntu
    
    # Install Docker Compose
    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    
    systemctl enable docker
    systemctl start docker
    EOF

  tags = {
    Name = var.ec2_backend_1_name
  }
}
*/


