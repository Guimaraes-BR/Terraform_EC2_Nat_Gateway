output "vpc_id" {
  value = aws_vpc.terraform_vpc.id
}

output "terraform_id_igw" {
  value = aws_internet_gateway.terraform_igw.id
}

output "terraform_rtb_id" {
  value = aws_route_table.terraform_rtb_public.id
}

output "subnet_id_pub_01" {
  value = aws_subnet.subnet_pub_01.id
}

output "subnet_id_pub_02" {
  value = aws_subnet.subnet_pub_02.id
}

output "subnet_id_priv_01" {
  value = aws_subnet.subnet_priv_01.id
}

output "subnet_id_priv_02" {
  value = aws_subnet.subnet_priv_02.id
}

output "security_group" {
  value = aws_security_group.allow_all_traffic.id
}

output "ec2_nat_gateway_public_ip" {
  value = aws_instance.ec2_nat_gateway.public_ip
}

output "ec2_private_ip" {
  value = aws_instance.ec2_private.private_ip
}

output "key_pair_name" {
  value = data.aws_key_pair.terraform_key_pair.key_name
}

output "eni_ec2_nat_gateway" {
  value = aws_network_interface.eni_ec2_nat_gateway.id
}
output "region" {
  value = var.region
}
