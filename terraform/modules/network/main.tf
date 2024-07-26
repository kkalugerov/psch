resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

# We'll need to also add an AWS Internet Gateway to enable this VPC to have any access to the public internet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = format("%s-igw", var.prefix)
  }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_1a.id

  tags = {
    Name = format("%s-ngw", var.prefix)
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_1a_cidr
  availability_zone = format("%sa", var.region)

  tags = {
    Name  = format("%s-%sb-public", var.prefix, var.region)
    Usage = "ALB"
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_1b_cidr
  availability_zone = format("%sb", var.region)

  tags = {
    Name  = format("%s-%sa-public", var.prefix, var.region)
    Usage = "ALB"
  }
}

resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_1a_cidr
  availability_zone = format("%sa", var.region)

  tags = {
    Name  = format("%s-%sa-private", var.prefix, var.region)
    Usage = "APP"
  }
}

resource "aws_subnet" "private_1b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_1b_cidr
  availability_zone = format("%sb", var.region)

  tags = {
    Name  = format("%s-%sb-private", var.prefix, var.region)
    Usage = "APP"
  }
}

resource "aws_subnet" "db_1a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.db_1a_cidr
  availability_zone = format("%sa", var.region)

  tags = {
    Name  = format("%s-%sa-db", var.prefix, var.region)
    Usage = "DB"
  }
}

resource "aws_subnet" "db_1b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.db_1b_cidr
  availability_zone = format("%sb", var.region)

  tags = {
    Name  = format("%s-%sb-db", var.prefix, var.region)
    Usage = "DB"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = format("%s-public-rt", var.prefix)
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = format("%s-private-rt", var.prefix)
  }
}

resource "aws_route_table" "db_rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }

  tags = {
    Name = format("%s-db-rt", var.prefix)
  }
}

resource "aws_route_table_association" "public_association_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_association_1b" {
  subnet_id      = aws_subnet.public_1b.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_association_1a" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_association_1b" {
  subnet_id      = aws_subnet.private_1b.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "db_association_1a" {
  subnet_id      = aws_subnet.db_1a.id
  route_table_id = aws_route_table.db_rt.id
}

resource "aws_route_table_association" "db_association_1b" {
  subnet_id      = aws_subnet.db_1b.id
  route_table_id = aws_route_table.db_rt.id
}
