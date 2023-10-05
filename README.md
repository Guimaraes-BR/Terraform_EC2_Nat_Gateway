Terraform para iniciantes

Nesta pasta contém a execução do Terraform para criar uma EC2 NAT Gateway apartir de uma imagem do Marktplace da AWS.

O objetivo deste laboratório, é criar uma EC2 em rede pública com NAT Gateway configurado e outra EC2 em rede privada sem IP Público.

Para verificar se a execução ocorreu normalmente, ao conectar na EC2 Nat Gateway com o IP público, faça um ping no ip privado da EC2 que está na rede privada.



Premissas

No arquivo "variables.tf", insira o id e secret do usuário criado no IAM para acesso pelo Terraform

Será necessário criar duas key pairs manuamente pelo portal nas regiões "us-west-2" #oregon com o nome "terraform_key_pair_development" e "us-east-2" #ohio, com o nome "terraform_key_pair_production" e fazer o download das mesmas.

Com essa particularidade ao criar e destruir o ambiente, a key pair continuará nas duas regiões.

Nos arquivos "production.tfvars" e development.tfvars, estão as variavéis para subir os projetos em regiões diferentes, como mencionado nas premissas.

Por exemplo,para executar como development, o comando será:

terraform plan --var-file=development.tfvars |
terraform apply --var-file=development.tfvars |
terraform destroy --var-file=development.tfvars

Para executar em outra região, sustitua o development por production.

No final da execução, como outputs, será exibido o IP público, o ip privado e outras informações.

Diagrama

![Diagrama EC2 Nat Gateway](https://github.com/Guimaraes-BR/Terraform_EC2_Nat_Gateway/assets/54118947/97122a22-d823-4ec2-b65c-39f893f08b81)











