#Cria uma VM para ser utilizada no lugar do nat gatway. A subnete privada tem que apontar para a eni dessa vm
resource "aws_instance" "ec2_nat_gateway" {
  ami                         = var.ami # nat gateway 07/2023
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet_pub_01.id
  vpc_security_group_ids      = [aws_security_group.allow_all_traffic.id]
  source_dest_check           = false
  associate_public_ip_address = true # para uma EC2 NAt Gateway, o IP público tem que estar como false. Está como true somente para efetuar uma conexão para esse laboratório
  availability_zone           = var.availability_zone
  key_name                    = data.aws_key_pair.terraform_key_pair.key_name

  depends_on = [
    aws_route_table_association.terraform_rtb_assoc_public_01
  ]

  tags = {
    Name        = "ec2_nat_gateway"
    environment = var.environment_tag
    owner       = var.owner_tag
  }
}


#Cria uma VM para na subnet privada para se conectar com a ec2 nat gateway
resource "aws_instance" "ec2_private" {
  ami                         = var.ami_private # nat gateway 07/2023
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet_priv_01.id
  vpc_security_group_ids      = [aws_security_group.allow_all_traffic.id]
  source_dest_check           = false
  associate_public_ip_address = false # para uma EC2 NAt Gateway, o IP público tem que estar como false. Está como true somente para efetuar uma conexão para esse laboratório
  availability_zone           = var.availability_zone
  key_name                    = data.aws_key_pair.terraform_key_pair.key_name

  depends_on = [
    aws_route_table_association.terraform_rtb_assoc_public_01
  ]

  tags = {
    Name        = "ec2_private"
    environment = var.environment_tag
    owner       = var.owner_tag
  }
}



