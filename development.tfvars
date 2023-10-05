region            = "us-west-2" #oregon
environment_tag   = "Development"
ami               = "ami-0249fcce31b8ac991"
ami_private       = "ami-038937b3d6616035f"
key_pair_name     = "terraform_key_pair_development"
availability_zone = "us-west-2a"

# command
# terraform apply --var-file=development.tfvars