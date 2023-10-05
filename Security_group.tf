resource "aws_security_group" "allow_all_traffic" {
  name        = "terraform_sg"
  description = "allow_all_traffic"
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    description      = "all_traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "terraform_sg"
    environment = var.environment_tag
    owner       = var.owner_tag
  }
}