output "ip_para_springboot" {
  # value = { for servicio, i in aws_instance.mi_app_spring : servicio => i.public_ip }
  value = [for i in aws_instance.mi_app_spring : i.public_ip]
}
