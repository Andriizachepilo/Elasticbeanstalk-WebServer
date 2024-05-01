output "https" {
  value = aws_security_group.lb_https.id
}

output "http" {
  value = aws_security_group.lb_http.id
}

output "ec2_sg" {
  value = aws_security_group.application_sg.id
}