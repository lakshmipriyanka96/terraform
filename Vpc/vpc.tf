resource "aws_vpc" "my1vpc" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = {
    Name = "VPC-Creation"
    VPC  = "true"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.my1vpc.id

  tags = {
    Name = "roboshop-igw"
  }
}

# ------------------- PUBLIC SUBNETS -------------------
resource "aws_subnet" "publicsubnet1" {
  vpc_id            = aws_vpc.my1vpc.id
  cidr_block        = var.publicsubnet1
  availability_zone = var.Pb_availability_zone1
  map_public_ip_on_launch = true

  tags = {
    Name   = "public-01"
    Public = "true"
  }
}

resource "aws_subnet" "publicsubnet2" {
  vpc_id            = aws_vpc.my1vpc.id
  cidr_block        = var.publicsubnet2
  availability_zone = var.Pb_availability_zone2
  map_public_ip_on_launch = true

  tags = {
    Name   = "public-02"
    Public = "true"
  }
}

# ------------------- PRIVATE SUBNETS -------------------
resource "aws_subnet" "privatesubnet1" {
  vpc_id            = aws_vpc.my1vpc.id
  cidr_block        = var.privatesubnet1
  availability_zone = var.Pv_availability_zone1

  tags = {
    Name    = "private-01"
    Private = "true"
  }
}

resource "aws_subnet" "privatesubnet2" {
  vpc_id            = aws_vpc.my1vpc.id
  cidr_block        = var.privatesubnet2
  availability_zone = var.Pv_availability_zone2

  tags = {
    Name    = "private-02"
    Private = "true"
  }
}

# ------------------- DB SUBNETS -------------------
resource "aws_subnet" "databasesubnet1" {
  vpc_id            = aws_vpc.my1vpc.id
  cidr_block        = var.databasesubnet1
  availability_zone = var.DB_availability_zone1

  tags = {
    Name = "database-subnet-01"
  }
}

resource "aws_subnet" "databasesubnet2" {
  vpc_id            = aws_vpc.my1vpc.id
  cidr_block        = var.databasesubnet2
  availability_zone = var.DB_availability_zone2

  tags = {
    Name = "database-subnet-02"
  }
}

# ------------------- ROUTE TABLES -------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my1vpc.id
  tags   = { Name = "public-route" }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.my1vpc.id
  tags   = { Name = "private-route" }
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.my1vpc.id
  tags   = { Name = "database-route" }
}

# ------------------- ROUTE ASSOCIATIONS -------------------
resource "aws_route_table_association" "pub1" {
  subnet_id      = aws_subnet.publicsubnet1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "pub2" {
  subnet_id      = aws_subnet.publicsubnet2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "priv1" {
  subnet_id      = aws_subnet.privatesubnet1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "priv2" {
  subnet_id      = aws_subnet.privatesubnet2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "db1" {
  subnet_id      = aws_subnet.databasesubnet1.id
  route_table_id = aws_route_table.database.id
}

resource "aws_route_table_association" "db2" {
  subnet_id      = aws_subnet.databasesubnet2.id
  route_table_id = aws_route_table.database.id
}

# ------------------- PUBLIC ROUTE -------------------
resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myigw.id
}

# ------------------- NAT + EIP -------------------
resource "aws_eip" "nat1" {
  domain = "vpc"
}

resource "aws_eip" "nat2" {
  domain = "vpc"
}

resource "aws_nat_gateway" "natgw1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.publicsubnet1.id
  depends_on    = [aws_internet_gateway.myigw]

  tags = var.tags
}

resource "aws_nat_gateway" "natgw2" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.publicsubnet2.id
  depends_on    = [aws_internet_gateway.myigw]

  tags = var.tags
}

# ------------------- PRIVATE + DB ROUTES -------------------
resource "aws_route" "private_route1" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.natgw1.id
}
resource "aws_route" "db_route" {
  route_table_id         = aws_route_table.database.id
  destination_cidr_block = var.dstcidrblock
  nat_gateway_id         = aws_nat_gateway.natgw1.id
}
