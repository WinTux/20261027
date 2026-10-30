variable "aws_region" {
  type = string
  default = "us-east-1"
}
# variable "una_region" {}
# variable "regioncita" {}
# variable "superregion" {}
# variable "reg" {}
variable "reg2" {}
variable "nombres_servicios" {
  description = "Nombre de los repositorios de EC2"
  type = set(string)
}
