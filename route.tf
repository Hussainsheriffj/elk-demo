resource "aws_route_table" "internet_route_table" {
  vpc_id = aws_vpc.elk_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "internet_route_table"
  }
}

resource "aws_route_table" "nat_route_table" {
  vpc_id = aws_vpc.elk_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

 

  tags = {
    Name = "nat_route_table"
  }
}

resource "aws_route_table_association" "public" {
subnet_id      = module.public.subnet_id
route_table_id = aws_route_table.internet_route_table.id
}

resource "aws_route_table_association" "private_monitor" {
subnet_id      = module.private_monitor.subnet_id
route_table_id = aws_route_table.nat_route_table.id
}

resource "aws_route_table_association" "private_application" {
  # for_each = aws_subnet.data

  subnet_id      = module.private_application.subnet_id
  route_table_id = aws_route_table.nat_route_table.id
}