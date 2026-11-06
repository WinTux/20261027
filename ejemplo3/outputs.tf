output "ip_para_springboot" {
  value = {for servicio, i in aws_instance.mi_app_spring : servicio => i.public_ip }
}
