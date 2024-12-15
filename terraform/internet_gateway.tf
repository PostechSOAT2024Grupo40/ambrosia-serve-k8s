resource "aws_internet_gateway" "gw" {
  depends_on = [aws_vpc.ambrosia_serve_vpc]

  vpc_id = aws_vpc.ambrosia_serve_vpc.id

  tags = {
    Name = "ambrosia_serve_vpc-igw"
  }

}
