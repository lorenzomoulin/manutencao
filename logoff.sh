#!/bin/bash

comandos='pkill -KILL -u '
usuario=`whoami`

echo "Digite a senha do usuario"
read -s pass

for i in {2..11}
do
	ip_local=$(cat /ip)
	if [ "10.9.2.$i" == $ip_local ] ; then

		continue
	fi

	echo "---------------------------------------Entrando em 10.9.2.$i"

	sshpass -p $pass ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $usuario@10.9.2.$i  $comandos$usuario
	echo "---------------------------------------Saindo de 10.9.2.$i"
done
