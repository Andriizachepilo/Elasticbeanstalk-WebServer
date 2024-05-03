resource "aws_security_group" "lb_https" {
  name        = "lb-sg-https"
  description = "Allow HTTP ingress and all egress"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "lb_http" {
  name        = "lb-sg-http"
  description = "Allow HTTPS ingress and all egress"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "application_sg" {
  name        = "EC2-sg"
  description = "Allow ingress only from ELB and all egress"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3000
    to_port         = 3003
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_https.id]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


