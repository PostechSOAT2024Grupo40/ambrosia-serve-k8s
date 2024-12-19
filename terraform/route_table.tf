
resource "aws_route_table" "public" {
  depends_on = [aws_vpc.ambrosia_serve_vpc]
  vpc_id     = aws_vpc.ambrosia_serve_vpc.id

  tags = {
    Name = "ambrosia_serve_vpc-rtb-public"
  }
}

resource "aws_route_table" "private_1" {
  depends_on = [aws_vpc.ambrosia_serve_vpc]
  vpc_id     = aws_vpc.ambrosia_serve_vpc.id

  tags = {
    Name = "ambrosia_serve_vpc-rtb-private1-us-east-1a"
  }
}
