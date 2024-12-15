resource "aws_eip" "elastic_ip" {
  depends_on           = [aws_network_interface.default]
  domain               = "vpc"
  network_border_group = var.region
  network_interface    = aws_network_interface.default.id
  public_ipv4_pool     = "amazon"
  tags = {
    Name = "ambrosia_serve_vpc-eip-us-east-1a"
  }
}
