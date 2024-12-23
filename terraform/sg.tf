resource "aws_security_group" "sg" {
  name        = "ambrosia-serve-sg"
  description = "Allow HTTP port 80 and all outbound traffic"
  vpc_id      = data.aws_vpc.ambrosia_serve_vpc.id

  tags = {
    Name = "ambrosia-serve-sg"
  }
}


resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4_80" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = data.aws_vpc.ambrosia_serve_vpc.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}
