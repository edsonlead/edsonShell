#!/bin/bash
#
#####[FICHA]#############################
#					#
# Nome: script instalação LAMP		#
# Versão: 1.0				#
# Autor: Edson Araújo			#
# Blog: edsonlead.blog.br		#
#					#
# ------------------------------------- #
#					#
# Descrição: Script desenvolvido para	#
# facilitar a instalação do LAMP, seus	#
# componentes separados e o CMS Joomla.	#
# 					#
#########################################

while : ; do
opcao=$(dialog --stdout \
		--radiolist 'Selecione o Componente:' 0 0 0 \
		Apache 'Instalação do Apache' OFF \
		MySQL 'Instalação do MySQL' OFF \
		PHP 'Instalação do PHP' OFF \
		PHPMyAdmin 'Instalação do PHPMyAdmin' OFF \
		LAMP 'Instalação dos Pacotes acima' ON \
		Joomla 'Download do Joomla!' OFF  )
[ $? -ne 0 ] && break

case $opcao in
	Apache) apt-get update && apt-get install apache2;;
	MySQL) apt-get update && apt-get install mysql-server-5.5 mysql-server-core-5.5 php5-mysql;;
	PHP) apt-get update && apt-get install php5;;
	PHPMyAdmin) apt-get update && apt-get install phpmyadmin;;
	LAMP) apt-get update && apt-get install apache2 mysql-server-5.5 mysql-server-core-5.5 php5-mysql php5 phpmyadmin;;
	Joomla) wget joomlacode.org/gf/download/frsrelease/18622/83487/Joomla_3.1.5-Stable-Full_Package.zip; unzip Joomla_3.1.5-Stable-Full_Package.zip;;
esac
done
