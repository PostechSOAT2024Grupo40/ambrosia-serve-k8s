resource "aws_subnet" "subnet_public_a" {
  depends_on        = [aws_vpc.ambrosia_serve_vpc]
  vpc_id            = aws_vpc.ambrosia_serve_vpc.id
  cidr_block        = "10.0.0.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "ambrosia_serve_vpc-subnet-public1-us-east-1a"
  }
}

resource "aws_subnet" "subnet_public_b" {
  depends_on        = [aws_vpc.ambrosia_serve_vpc]
  vpc_id            = aws_vpc.ambrosia_serve_vpc.id
  cidr_block        = "10.0.16.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "ambrosia_serve_vpc-subnet-public2-us-east-1b"
  }
}


resource "aws_subnet" "subnet_private_a" {
  depends_on                          = [aws_vpc.ambrosia_serve_vpc]
  vpc_id                              = aws_vpc.ambrosia_serve_vpc.id
  cidr_block                          = "10.0.128.0/20"
  private_dns_hostname_type_on_launch = "ip-name"
  availability_zone_id                = "use1-az1"

  tags = {
    Name = "ambrosia_serve_vpc-subnet-private1-us-east-1a"
  }
}

resource "aws_subnet" "subnet_private_b" {
  depends_on                          = [aws_vpc.ambrosia_serve_vpc]
  vpc_id                              = aws_vpc.ambrosia_serve_vpc.id
  cidr_block                          = "10.0.144.0/20"
  availability_zone_id                = "use1-az2"
  private_dns_hostname_type_on_launch = "ip-name"

  tags = {
    Name = "ambrosia_serve_vpc-subnet-private2-us-east-1b"
  }
}
