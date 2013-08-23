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
	Instalação 'Instalação de Programas' \
	Sobre 'Ficha Técnica do Aplicativo' \
	Sair 'Sair do Aplicativo')
	[ $? -ne 0 ] && break
case $menu in
	Instalação) instala=$(dialog --stdout \
				--radiolist 'O Que Deseja Instalar?' 0 0 0 \
				Web 'Instalação do LAMP, seus Componentes e o Joomla' ON \
				Design 'Instalação do GIMP e o Inkscape' OFF )
				
				case $instala in
					Web) instalaweb=$(dialog --stdout \
							--radiolist 'Selecione o Componente:' 0 0 0 \
							Apache 'Instalação do Apache' OFF \
							MySQL 'Instalação do MySQL' OFF \
							PHP 'Instalação do PHP' OFF \
							PHPMyAdmin 'Instalação do PHPMyAdmin' OFF \
							LAMP 'Instalação dos Pacotes acima' ON \
							Joomla 'Download do Joomla!' OFF \
							Voltar 'Voltar ao Menu Anterior' OFF\
							Sair 'Sair do Aplicativo' OFF )
		
							case $instalaweb in
								Apache) apt-get update && apt-get install apache2;;
								MySQL) apt-get update && apt-get install mysql-server-5.5 mysql-server-core-5.5 php5-mysql;;
								PHP) apt-get update && apt-get install php5;;
								PHPMyAdmin) apt-get update && apt-get install phpmyadmin;;
								LAMP) apt-get update && apt-get install apache2 mysql-server-5.5 mysql-server-core-5.5 php5-mysql php5 phpmyadmin;;
								Joomla) wget joomlacode.org/gf/download/frsrelease/18622/83487/Joomla_3.1.5-Stable-Full_Package.zip; unzip Joomla_3.1.5-Stable-Full_Package.zip;;
								Voltar) anterior=instalaweb;;
								Sair) dialog --title 'Você escolheu Sair' --msgbox 'Obrigado por utilizar este Aplicativo\nAcesse: edsonlead.blog.br' 6 40 ; break;;
							esac;;
					Design) instaladesign=$(dialog --stdout \
								--radiolist 'Selecione o Aplicativo:' 0 0 0 \
								GIMP 'Instalação do GIMP' ON \
								Inkscape 'Instalação do Inkscape' OFF \
								Voltar 'Voltar ao Menu Anterior' OFF \
								Sair 'Sair do Aplicativo' OFF )
								
								case $instaladesign in
									GIMP) add-apt-repository ppa:otto-kesselgulasch/gimp -y apt-get update && apt-get install gimp;;
									Inkscape) apt-get update && apt-get install inkscape;;
									Voltar) anterior=instaladesign;;
									Sair) dialog --title 'Você escolheu Sair' --msgbox 'Obrigado por utilizar este Aplicativo\nAcesse: edsonlead.blog.br' 6 40 ; break;;
								esac;;
	
esac;;
		Sobre) dialog --title 'Sobre' --msgbox 'Nome: installShell\nVersão: 2.0\nAutor: Edson Araújo\nBlog: edsonlead.blog.br' 10 40 ;;
		Sair) dialog --title 'Você escolheu Sair' --msgbox 'Obrigado por utilizar este Aplicativo\nAcesse: edsonlead.blog.br' 6 40 ; break;;
esac
done
