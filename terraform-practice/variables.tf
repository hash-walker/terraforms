variable "ec2_instance_type" {
  description = "AWS ec2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "my-vpc"
}

variable "vpc_cidr" {
  description = "vpc cidr"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_name_1" {
  description = "public subnet 1"
  type        = string
  default     = "public-subnet-1"
}

variable "public_subnet_cidr_1" {
  description = "public subnet cidr 1"
  type        = string
  default     = "10.0.0.0/24"
}

variable "private_subnet_name_1" {
  description = "private subnet 1"
  type        = string
  default     = "private-subnet-1"
}

variable "private_subnet_cidr_1" {
  description = "private subnet cidr 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_name_2" {
  description = "public subnet 2"
  type        = string
  default     = "public-subnet-2"
}

variable "public_subnet_cidr_2" {
  description = "public subnet cidr 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_name_2" {
  description = "private subnet 2"
  type        = string
  default     = "privates-subnet-2"
}

variable "private_subnet_cidr_2" {
  description = "private subnet cidr 2"
  type        = string
  default     = "10.0.3.0/24"
}

variable "internet_gw" {
  description = "internet gateway"
  type        = string
  default     = "terraforms_gw"
}

variable "ec2_ami" {
  description = "EC2 ubuntu ami"
  type        = string
  default     = "ami-0ecb62995f68bb549"
}

variable "ec2_frontend_1_name" {
  description = "EC2 frontend in zone 1"
  type        = string
  default     = "ec2_frontend_1"
}

variable "ec2_backend_1_name" {
  description = "EC2 backend in zone 1"
  type        = string
  default     = "ec2_backend_1"
}
