output "public_ips" {
  value = [aws_instance.wordpress_app.public_ip]
}

output "private_ips" {
  value = [aws_instance.wordpress_app.private_ip]
}

output "wordpress_app_id" {
  description = "ID de la instancia WordPress"
  value       = aws_instance.wordpress_app.id
}

