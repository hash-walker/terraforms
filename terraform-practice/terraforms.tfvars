instance_name     = "my-ec2-instance"
ec2_instance_type = "t3.micro"
ec2_ami           = "ami-0ecb62995f68bb549" # I filled this in (empty "" will cause an error!)

vpc_name = "my-vpc"
vpc_cidr = "10.0.0.0/16"

# --- Subnet Configuration ---
public_subnet_name_1 = "public-subnet-1"
public_subnet_cidr_1 = "10.0.0.0/24"

private_subnet_name_1 = "private-subnet-1"
private_subnet_cidr_1 = "10.0.1.0/24"

public_subnet_name_2 = "public-subnet-2"
public_subnet_cidr_2 = "10.0.2.0/24"

private_subnet_name_2 = "privates-subnet-2" # Kept your 'privates' typo as requested
private_subnet_cidr_2 = "10.0.3.0/24"

# --- Gateway ---
internet_gw = "terraforms_gw"

# --- EC2 Names ---
ec2_web_1_name = "ec2_frontend_1"
ec2_web_2_name = "ec2_frontend_2"
ec2_db_1_name  = "ec2_backend_1"
ec2_db_2_name  = "ec2_backend_2"