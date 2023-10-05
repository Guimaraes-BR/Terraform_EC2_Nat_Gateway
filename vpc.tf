#Cria a VPC
resource "aws_vpc" "terraform_vpc" {
  cidr_block           = var.cidr_block_vpc
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "terraform_vpc"
    environment = var.environment_tag
    owner       = var.owner_tag
  }
}

#Cria a Internet Gateway
resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name        = "terraform_igw"
    environment = var.environment_tag
    owner       = var.owner_tag
  }
}

#Cria duas Route tables, pública e privada
resource "aws_route_table" "terraform_rtb_public" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }

  tags = {
    Name        = "terraform_rtb_public"
    environment = var.environment_tag
    owner       = var.owner_tag
  }
}

resource "aws_route_table" "terraform_rtb_private" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.eni_ec2_nat_gateway.id # aponta para a network da EC2 criada, para ser a saída de intenet para subnets privadas

  }

  tags = {
    Name        = "terraform_rtb_private"
    environment = var.environment_tag
    owner       = var.owner_tag
  }
}

#Cria a network interface para associar a subnet privada
resource "aws_network_interface" "eni_ec2_nat_gateway" {
  subnet_id = aws_subnet.subnet_priv_01.id

  attachment {
    instance     = aws_instance.ec2_nat_gateway.id
    device_index = 1
  }
}

#Cria a associação entre as subnets públicas e as RTs
resource "aws_route_table_association" "terraform_rtb_assoc_public_01" {
  route_table_id = aws_route_table.terraform_rtb_public.id
  subnet_id      = aws_subnet.subnet_pub_01.id

}

resource "aws_route_table_association" "terraform_rtb_assoc_public_02" {
  route_table_id = aws_route_table.terraform_rtb_public.id
  subnet_id      = aws_subnet.subnet_pub_02.id

}

#Cria a associação entre as subnets privadas e as RTs
resource "aws_route_table_association" "terraform_rtb_assoc_private_01" {
  route_table_id = aws_route_table.terraform_rtb_private.id
  subnet_id      = aws_subnet.subnet_priv_01.id

}

resource "aws_route_table_association" "terraform_rtb_assoc_private_02" {
  route_table_id = aws_route_table.terraform_rtb_private.id
  subnet_id      = aws_subnet.subnet_priv_02.id

}


#subnets publicas
resource "aws_subnet" "subnet_pub_01" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.cidr_block_sub_pub_01
  availability_zone = var.availability_zone
  #count = var.count_sub_pub

  tags = {
    Name        = "terraform_sub_pub_01"
    environment = var.environment_tag
    owner       = var.owner_tag
  }
}
resource "aws_subnet" "subnet_pub_02" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.cidr_block_sub_pub_02

  tags = {
    Name        = "terraform_sub_pub_02"
    environment = var.environment_tag
    owner       = var.owner_tag
  }
}

#subnets privadas
resource "aws_subnet" "subnet_priv_01" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.cidr_block_sub_priv_01
  availability_zone = var.availability_zone

  tags = {
    Name        = "terraform_sub_priv_01"
    environment = var.environment_tag
    owner       = var.owner_tag
  }
}
resource "aws_subnet" "subnet_priv_02" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.cidr_block_sub_priv_02

  tags = {
    Name        = "terraform_sub_priv_02"
    environment = var.environment_tag
    owner       = var.owner_tag
  }
}