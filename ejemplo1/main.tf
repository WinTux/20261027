provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "web" {
  ami = "ami-3i45yu3i54i4g3k54"
  instance_type = "t2.micro"
}
