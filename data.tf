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