resource "aws_lb" "main" {
  name               = "wordpress-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_ids
  subnets            = var.subnet_ids

  tags = {
    Name = "WordPressLoadBalancer"
  }
}

resource "aws_lb_target_group" "mean" {
  name     = "mean-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    protocol            = "HTTP"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mean.arn
  }
}

# Registrar las instancias en el grupo de destino
resource "aws_lb_target_group_attachment" "wordpress_app" {
  target_group_arn = aws_lb_target_group.mean.arn
  target_id        = var.wordpress_app_instance_id
  port             = 80
}

output "dns_name" {
  value = aws_lb.main.dns_name
}
