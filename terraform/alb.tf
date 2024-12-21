resource "aws_alb" "alb" {
  depends_on                 = [aws_security_group.sg, aws_subnet.subnet_private_a, aws_subnet.subnet_private_b]
  name                       = "production-alb"
  internal                   = true
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.sg.id]
  subnets                    = [aws_subnet.subnet_private_a.id, aws_subnet.subnet_private_b.id]
  idle_timeout               = 60
  enable_deletion_protection = false


  tags = {
    Name = "production-alb"
  }
}


resource "aws_lb_listener" "listener" {
  depends_on        = [aws_alb.alb]
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_target_group" "tg" {
  name        = "TG-ambrosia-serve"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"

  vpc_id = aws_vpc.ambrosia_serve_vpc.id

  health_check {
    path    = "/health"
    port    = 80
    matcher = "200"
  }
}

resource "aws_lb_target_group_attachment" "attach" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = data.aws_instance.ec2.id
  port             = 80
}