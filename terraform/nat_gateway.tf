resource "aws_nat_gateway" "nat_gw_public" {
  depends_on = [aws_internet_gateway.gw]

  subnet_id                = aws_subnet.subnet_public_a.id
  allocation_id            = aws_eip.elastic_ip.id
  secondary_allocation_ids = []

  tags = {
    Name = "ambrosia_serve_vpc-nat-public1-us-east-1a"
  }

}
