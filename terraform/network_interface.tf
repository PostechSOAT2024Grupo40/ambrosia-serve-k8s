resource "aws_network_interface" "default" {
  depends_on                = [aws_subnet.subnet_public_a]
  subnet_id                 = aws_subnet.subnet_public_a.id
  private_ips               = ["10.0.3.185"]
  description               = "Interface for NAT Gateway nat-0c855d69405b8b434"
  ipv6_address_list_enabled = false
  private_ip_list_enabled   = false
  source_dest_check         = false

  tags = {
    Name = "ambrosia_serve_vpc-network-interface"
  }
}
