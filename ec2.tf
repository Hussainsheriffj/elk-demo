# resource "aws_instance" "test_server" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.medium"

#   vpc_security_group_ids = [aws_security_group.test_server.id]
#   key_name = "talent-academy-lab"
#   subnet_id = data.aws_subnet.Elk.id


#   tags = {
#     Name = "Test Server"
#   }
# }

resource "aws_eip" "elk_test_ip" {
  instance = aws_instance.test_server.id
  vpc      = true
}

module "kibana" {
  source ="./ec2-module"
  ami = data.aws_ami.kibana_id.id
  inst_type = "t2.micro"
  security_id = aws_security_group.test_server.id
  key_pair = data.aws_key_pair.eu_key.key_name
  subnet_ids = data.aws_subnet.public_subnet.id
  ec2_name = "kibana-server"
}

module "bastion" {
  source ="./ec2-module"
  ami = data.aws_ami.ubuntu.id
  security_id = aws_security_group.test_server.id
  key_pair = data.aws_key_pair.eu_key.key_name
  subnet_ids = data.aws_subnet.public_subnet.id
  ec2_name = "bastion-server"
}

