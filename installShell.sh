#!/bin/bash
#
#####[FICHA]#############################
#					#
# Nome: installShell			#
# Versão: 2.0				#
# Autor: Edson Araújo			#
# Blog: edsonlead.blog.br		#
#					#
# ------------------------------------- #
#					#
# DescriçãoV1: Script desenvolvido para	#
# facilitar a instalação do LAMP, seus	#
# componentes separados e o CMS Joomla.	#
# ------------------------------------  #
# DescriçãoV2: alterações aplicadas(	#
# menu principal, tratamento de telas,	#
# troca de nome do aplicativo)		#
#########################################
while : ; do
menu=$(dialog --stdout \
	--title 'Menu' \
	--menu 'Selecione uma opção:' \
	0 0 0 \
	Instalação 'Instalação do LAMP, seus Componentes e Joomla' \
	Sobre 'Ficha Técnica do Aplicativo' )
	[ $? -ne 0 ] && break
case $menu in
	Instalação) opcao=$(dialog --stdout \
				--radiolist 'Selecione o Componente:' 0 0 0 \
				Apache 'Instalação do Apache' OFF \
				MySQL 'Instalação do MySQL' OFF \
				PHP 'Instalação do PHP' OFF \
				PHPMyAdmin 'Instalação do PHPMyAdmin' OFF \
				LAMP 'Instalação dos Pacotes acima' ON \
				Joomla 'Download do Joomla!' OFF \
				Voltar 'Voltar ao Menu Principal' OFF\
				Sair 'Sair do Aplicativo' OFF )
		

		case $opcao in
			Apache) apt-get update && apt-get install apache2;;
			MySQL) apt-get update && apt-get install mysql-server-5.5 mysql-server-core-5.5 php5-mysql;;
			PHP) apt-get update && apt-get install php5;;
			PHPMyAdmin) apt-get update && apt-get install phpmyadmin;;
			LAMP) apt-get update && apt-get install apache2 mysql-server-5.5 mysql-server-core-5.5 php5-mysql php5 phpmyadmin;;
			Joomla) wget joomlacode.org/gf/download/frsrelease/18622/83487/Joomla_3.1.5-Stable-Full_Package.zip; unzip Joomla_3.1.5-Stable-Full_Package.zip;;
			Voltar) anterior=Instalação;;
			Sair) dialog --title 'Você escolheu Sair' --msgbox 'Obrigado por utilizar este Aplicativo\nAcesse: edsonlead.blog.br' 6 40 ; break;;
		esac;;
	Sobre) dialog --title 'Sobre' --msgbox 'Nome: installShell\nVersão: 2.0\nAutor: Edson Araújo\nBlog: edsonlead.blog.br' 10 40 ;
esac
done
