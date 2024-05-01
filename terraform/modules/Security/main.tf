# resource "aws_security_group" "ingress" {
#   vpc_id = var.vpc_id

#   dynamic "ingress" {
#     for_each = var.ingress_traffic
#     content {
#       from_port   = ingress.value.from_port
#       to_port     = ingress.value.to_port
#       protocol    = ingress.value.protocol
#       cidr_blocks = ingress.value.cidr_blocks
#     }
#   }
# }

# resource "aws_security_group" "egress" {
#   vpc_id = var.vpc_id

#   dynamic "egress" {
#     for_each = var.egress_traffic
#     content {
#       from_port   = egress.value.from_port
#       to_port     = egress.value.to_port
#       protocol    = egress.value.protocol
#       cidr_blocks = egress.value.cidr_blocks
#     }
#   }
# }

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Example security group allowing all traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "loadbalancer_sg" {
  name        = "lb-sg"
  description = "Allow HTTPS ingress and all egress"
  vpc_id      = var.vpc_id

  ingress = {
    from_port  = 443
    to_port    = 443
    protocol   = "tcp"
    cidr_block = ["0.0.0.0/0"]
  }

  egress = {
    from_port  = 0
    to_port    = 65535
    protocol   = "tcp"
    cidr_block = ["0.0.0.0/0"]
  }

}


