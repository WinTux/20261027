#!/bin/bash
# Inventario dinámico en formato JSON válido para Ansible

# Obtenemos las IPs desde Terraform
IPS=$(terraform output -json ip_para_springboot | jq -r '.[]')

# Iniciamos el inventario JSON
echo '{'
echo '  "springboot": {'
echo '    "hosts": ['
PRIMERO=1
for ip in $IPS; do
  if [ $PRIMERO -eq 1 ]; then
    echo "\"$ip\""
    PRIMERO=0
  else
    echo ",\"$ip\""
  fi
done
echo '    ],'
echo '    "vars": {'
echo '      "ansible_user": "ubuntu",'
echo '      "ansible_ssh_private_key_file": "/home/rusok/Descargas/ParClaves20261028.pem"'
echo '    }'
echo '  }'
echo '}'
