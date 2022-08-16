resource "aws_vpc" "elk_vpc" {
  cidr_block = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-elk"
  }
}

module "public" {
    source = "./network-module"
    vpc_id  =  aws_vpc.elk_vpc.id 
    subnet_cidr =  "192.168.1.0/24"
    subnet_name =  "public_subnet"
    is_public   =  true
}

module "private_monitor" {
    source = "./network-module"
    vpc_id  =  aws_vpc.elk_vpc.id 
    subnet_cidr =  "192.168.2.0/24"
    subnet_name =  "private_subnet_monitor"
}

module "private_application" {
    source = "./network-module"
    vpc_id  =  aws_vpc.elk_vpc.id 
    subnet_cidr =  "192.168.3.0/24"
    subnet_name =  "private_subnet_application"
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.elk_vpc.id

  tags = {
    Name = "Internet gateway"
  }
}