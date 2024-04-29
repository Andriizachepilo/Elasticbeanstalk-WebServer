# output "ingress" {
#   value = aws_security_group.ingress.id
# }

# output "egress" {
#   value = aws_security_group.egress.id
# }

output "my_sg" {
  value = aws_security_group.example.id
}