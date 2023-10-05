# Key Pair foi criada manualmente no portal. Ao utilizar como data, ela não é destruída.
data "aws_key_pair" "terraform_key_pair" {
  key_name           = var.key_pair_name
  include_public_key = true

}




