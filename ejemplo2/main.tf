terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region = var.reg2
}

locals {
  un_tag = "produccion-acceso-anticipado"
}

resource "aws_instance" "mi_servidor" {
  for_each = var.nombres_servicios
  ami = "ami-0d97d7f07b25dd693"
  instance_type = "t3.micro"
  subnet_id = "subnet-0ec43cfc20f6562ea"
  tags = {
    Sistema = local.un_tag
    Name = "ServidorTerraform"
    Environment = "Dev"
    Owner = "Pepe"
  }
}
