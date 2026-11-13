variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ruta_private_key" {
  type = string
  description = "Ruta del archivo PEM para conexión SSH."
}
