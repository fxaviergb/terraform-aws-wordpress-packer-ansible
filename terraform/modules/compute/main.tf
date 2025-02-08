resource "aws_instance" "wordpress_app" {
  ami             = var.wordpress_ami
  instance_type   = "t2.micro"
  subnet_id       = var.subnet_ids[0]
  security_groups = var.security_ids

  tags = {
    Name = "WordPress-Instance"
  }
}
