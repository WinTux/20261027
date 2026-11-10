#!/bin/bash
echo "[springboot]" > inventario_2.ini
terraform output -json ip_para_springboot | jq -r '.[]' >> inventario_2.ini
echo "[springboot:vars]" >> inventario_2.ini
echo "ansible_user=ubuntu" >> inventario_2.ini
echo "ansible_ssh_private_key_file=/home/rusok/Descargas/ParClaves20261028.pem" >> inventario_2.ini
