terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region = var.reg2
}

locals {
  un_tag = "produccion-acceso-anticipado"
  nombre_workspace = terraform.workspace
}

#data "aws_subnet" "default" {
#  default_for_az = true
#}

resource "aws_instance" "mi_servidor" {
  count = terraform.workspace == "produccione" ? 2 : 1
  ami           = "ami-0d97d7f07b25dd693"
  instance_type = "t3.micro"
  subnet_id     = "subnet-0ec43cfc20f6562ea"
#  subnet_id = data.aws_subnet.default.id
#  subnet_id = module.vpc.public_subnets[0]
#  vpc_security_group_ids = [module.terraform-sg.security_group_id]
#  associate_public_ip_address = true
  tags = {
    Sistema     = local.un_tag
    Name        = format("%s-%s", terraform.workspace, count.index)
    Environment = "Dev"
    Owner       = "Pepe"
  }
}

resource "aws_cloudwatch_log_group" "grupo_log_ec2" {
  for_each = var.nombres_servicios
  tags = {
    Environment = "prueba"
    Servicio = each.key
  }
  lifecycle {
    create_before_destroy = true
  }
}
