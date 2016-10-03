#!/bin/bash

#########################################################
#							#
#			DumpDB.sh			#
#							#
# Finalidade:						#
#	Cria backup da base de dados 		 	#
#	$banco de dados					#
#							#
# 							#
# Autor:						#
#	Angelo Grossi                                   #
#	vongrossi@gmail.com				#
# Versão:						#
#	0.5						#
#                    					#
# Data:						 	#
#	09/08/2016					#
#							#
# Info:							#
#	Nesta versão foi adicionado o suporte a 	#
#	envio de emails com mailutils 			#
#	(para que funcione corretamente e necessario	#
#	ter instalado o pacote mailutils		#
#	apt-get install mailutils 			#
#	pacman -s mailtuils)				#
#        						#
# Notas:						#
#	Futuras implementações será adicionado 		#
#	o suporte a envio de mensagem com telegram 	#
#	e ou whatsapp					#
#							#
#			    				#
#	 						#
#							#
#########################################################



# CRIA ARQUIVO VAZIO COM PERMISSAO 666
file="DB_$(date '+%Y.%m.%d').bak"


#NOME DO BANCO DE DADOS QUE SERÁ BACKUPEADO
banco_de_dados=nome_do_banco 


#NUMERO DE DIAS QUE SERÁ MANTIDO SALVO O BACKUP
numero_dias=5

# DIRETORIO ONDE SERÃO SALVOS OS BACKUPS
backup_dir="home/_SEU_USUARIO/_DESTINO"



#ESCREVE MENSAGEM DIZENDO QUE BACKUP ESTA SENDO GERADO

 echo "Gerando backup de $banco_de_dados "

# GERANDO O DUMP DO BANCO E COMPACTANDO USANDO GZIP
pg_dump $banco_de_dados | pv | gzip > /$backup_dir$file.gz


#EXECUTA A ROTINA DE LIMPEZA DE BACKUPS ANTIGOS 
find /$backup_dir -type f -prune -mtime +$numero_dias -exec rm -f {} \;


#ENVIO DE EMAIL
inicio="`date +%Y-%m-%d_%H:%M:%S`"
EMAIL="seu_email@provedor.com"
ERRORLOG="$backup_dir/erro.log"
ERROR=0;
 
 
#@ ENVIANDO EMAIL
echo ">>> envio de email de comfirmacao para $EMAIL"
if [ "$ERROR" -eq 1 ]; then
cat $ERRORLOG | mail $EMAIL -s "=( Erro no backup `date`";
else
echo "Backup do banco do canvas realizado com sucesso em `date`" | mail $EMAIL -s " =) Backup ok em `date`"
fi
 
echo "Rotina inciou em: $inicio"
echo "Rotina terminou em: `date +%Y-%m-%d_%H:%M:%S`"

