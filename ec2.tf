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