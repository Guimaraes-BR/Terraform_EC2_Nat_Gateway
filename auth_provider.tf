provider "aws" {
  region     = var.region
  access_key = var.access_key #inserir o ID no arquivo variables.tf
  secret_key = var.secret_key #inserir o Secret no arquivo variables.tf
}
