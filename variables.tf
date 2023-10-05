variable "region" {
  default     = "us-east-2" #ohio
  type        = string
  description = "Define a região de execução"
}

variable "access_key" {
  default     = "AKIAZTE4AMOVW2MKBSFI"
  type        = string
  description = "access_key"
}

variable "secret_key" {
  default     = "RlJexuNTcPqPudUleejpkOY2azuSukpjpXUae7x5"
  type        = string
  description = "secret_key"
}

variable "owner_tag" {
  default     = "Terraform"
  type        = string
  description = "Criado pelo Terraform"
}

variable "environment_tag" {
  default     = "Development"
  type        = string
  description = "Define o ambiente de execução"
}

variable "cidr_block_vpc" {
  default     = "10.100.0.0/16"
  type        = string
  description = "Define o cidr block da VPC"
}

variable "cidr_block_sub_pub_01" {
  default     = "10.100.1.0/24"
  type        = string
  description = "Define o cidr block da sub_pub_01"
}

variable "availability_zone" {
  default     = "us-east-2a"
  type        = string
  description = "Define a local zone utilizada"
}

variable "cidr_block_sub_pub_02" {
  default     = "10.100.2.0/24"
  type        = string
  description = "Define o cidr block da sub_pub_02"
}

variable "cidr_block_sub_priv_01" {
  default     = "10.100.3.0/24"
  type        = string
  description = "Define o cidr block da sub_priv_01"
}

variable "cidr_block_sub_priv_02" {
  default     = "10.100.4.0/24"
  type        = string
  description = "Define o cidr block da sub_priv_02"
}

variable "ami" {
  default     = "ami-015f251c94222fb32"
  type        = string
  description = "AM usada como nat gateway"
}

variable "ami_private" {
  default     = "ami-015f251c94222fb32"
  type        = string
  description = "AM usada como nat gateway"
}

variable "instance_type" {
  default     = "t2.micro"
  type        = string
  description = "Tupo de instância padrão"
}

variable "key_pair_name" {
  default     = "terraform_key_pair"
  type        = string
  description = "Nome da Key Pair utilizada"
}


# variable "count_sub_priv" {
#   default     = 2
#   type        = number
#   description = "Quantidade de subnets privadas"
# }