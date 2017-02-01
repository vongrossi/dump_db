
#### dumpdb.sh	
#### Finalidade:		
 - Cria backup da base de dados PostgreSQL
#### Versão:	0.5
              
#### Data:	09/08/2016		

##### Info:	

Nesta versão foi adicionado o suporte a 	
envio de emails com mailutil add pv suporte


    apt-get install pv 
 ou 
 
 	pacman -S pv              

 
 Para que funcione corretamente e necessario	
 ter instalado o pacote mailutils)		
	
    
    apt-get install mailutils
 ou
 
	pacman -s mailutils			
#### Notas:						

Futuras implementações será adicionado 		
o suporte a envio de mensagem com telegram 	
e ou whatsapp

#### Uso:

Para execução com um usuário local deve ser passado o usuário com permissão de execução

	sudo su -c 'sh dumpdb.sh' - postgres
