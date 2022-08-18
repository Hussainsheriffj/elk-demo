data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  #we removed few lines we don't need it (hvm)

  owners = ["099720109477"] # Canonical
}

data "aws_subnet" "Elk" {
    filter {
      name   = "tag:Name"
      values = ["public_subnet"]
  } 
}

data "aws_vpc" "elk_vpc"{
  filter {
    name = "tag:Name"
    values = ["Elk-vpc"]
  }
}

data "aws_internet_gateway" "elk_igw" {
  filter {
    name = "tag:Name"
    values =  "Internet gateway"
  }
  
}

data "aws_ami" "kibana_id" {
  most_recent = true

  filter {
    name   = "name"
    values = ["kibana"]
  }

  #we removed few lines we don't need it (hvm)

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "logstach_id" {
  most_recent = true

  filter {
    name   = "name"
    values = ["logstach"]
  }

  #we removed few lines we don't need it (hvm)

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "elasticsearch" {
  most_recent = true

  filter {
    name   = "name"
    values = ["elasticsearch"]
  }

  #we removed few lines we don't need it (hvm)

  owners = ["099720109477"] # Canonical
}

data "aws_key_pair" "eu_key" {
  key_name = "talent-academy-lab"
  include_public_key = true
}