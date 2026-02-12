resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"

  tags = {
   Name = "Project_vpc"

}
}
##Creating Internet gateway

resource "aws_internet_gateway" "IGW" {
 vpc_id = aws_vpc.main.id

tags = {
 Name = "Internetgt1"
}
}
#creating a public subnet

resource "aws_subnet" "pb1" {
 vpc_id = aws_vpc.main.id
 cidr_block = "10.0.1.0/24"
 availability_zone = "us-west-1a"
 tags = {
 Name = "Publicsubnet1"

}
}
resource "aws_subnet" "pb2" {
 vpc_id = aws_vpc.main.id
 cidr_block = "10.0.2.0/24"
 availability_zone = "us-west-1b"
 tags = {
 Name = "Publicsubnet2"

}
}

#Now create a public route table

resource "aws_route_table" "RTB1" {
 vpc_id =aws_vpc.main.id

  tags = {
 Name = "RTB1"
}
}
#Now provide route to InternetGateway
resource "aws_route" "ARPB1" {
route_table_id = aws_route_table.RTB1.id
destination_cidr_block = "0.0.0.0./0"
Internet_gatewayid = aws_internet_gateway.IGW.id
}

#Now associate the public route table with Public subnet
resource "aws_route_table_association" "ARTBA1" {
public_subnet = aws_subnet.pb1.id
routetable_id = aws_route_table.RTB1.id
}
#Now create a public route table

resource "aws_route_table" "RTB2" {
 vpc_id =aws_vpc.main.id

  tags = {
 Name = "RTB2"
}
}
#Now provide route to InternetGateway
resource "aws_route" "ARPB2" {
route_table_id = aws_route_table.RTB2.id
destination_cidr_block = "0.0.0.0./0"
Internet_gatewayid = aws_internet_gateway.IGW.id
}

#Now associate the public route table with Public subnet
resource "aws_route_table_association" "ARTBA2" {
public_subnet = aws_subnet.pb2.id
routetable_id = aws_route_table.RTB2.id
}
