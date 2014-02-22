Projeto Crédito
===============

Projeto desenvolvido nas aulas de OSB (Oracle Service Bus) da SOA Expert (módulo 2).

O objetivo do projeto é verificar se uma determinada empresa possui crédito aprovado em três locais (Serasa, SPC e Casas Bahia).

Todo o fluxo de aprovação foi implementado dentro do barramento.

Ferramentas utilizadas:
-----------------------
- JDK 1.6.0_45
- Eclipse OEPE - Release 3.7.0 (Indigo) (oepe-indigo-all-in-one-11.1.1.8.0.201110211138-linux-gtk-x86_64.zip)
- JDeveloper 11g release 1 (11.1.1.7.0) (jdevstudio11117install.jar)
- Oracle WebLogic Server 11gR1 (10.3.6) (wls1036_generic.zip)
- Oracle XE 11.2.0 (oracle-xe-11.2.0-1.0.x86_64.rpm.zip
- RCU (ofm_rcu_linux_11.1.1.7.0_64_disk1_1of1.zip)
- Oracle SOA Suite 11.1.1.7.0 (ofm_soa_generic_11.1.1.7.0_disk1_1of2.zip e ofm_soa_generic_11.1.1.7.0_disk1_2of2.zip)

Roteiro de configuração do ambiente:
------------------------------------
- Quando for adicionar o weblogic dentro do eclipse, criar (ou apontar) para um domínio próprio, ex: osb_domain

- Configurar o weblogic para exibir a janela de teste na console do OSB:
	- Na tela inicial do WebLogic, clicar em Servers (seção Environment) -> AdminServer(admin) -> preencher o campo "Listen Address" com "localhost" -> save

- Configurar o conector JCA no Weblogic
 	- Menu "Deployments"
 	- localizar e clicar no item "DbAdapter" 
	- aba "Configuration" 
	- aba "Outbound Connection Pools" - New 
	- selecionar o único valor "javax.resource.cci.ConnectionFactory" - next 
	- preecher o campo JNDI Name com "eis/DB/empresa" - finish
	- expandir o item "javax.resource.cci.ConnectionFactory"
	- clicar no link "eis/DB/empresa"
	- clicar no valor da coluna "Property Value" da linha "dataSourceName"
	- preencher com o valor "empresaDS" - teclar enter em seguida - save
	- menu "Deployments"
 	- localizar e selecionar o item "DbAdapter" - Update - next - finish

- Configurar o datasource no Weblogic
	- Menu "Services" - "Data Sources"
	- New - Generic Data Source
		- Name = empresaDS
		- JNDI Name = empresaDS
		- Database Type = Oracle
	- Selecionar driver não-XA: "Oracle's Driver (Thin) for instance connections; Versions:9.0.1 and later" - next
	- Desmarcar o campo "Supports Global Transactions" - next
		- Database Name = xe
		- Host Name = localhost
		- Port = 1521
		- Database User Name = SOA_EXPERT
		- Password = SOA_EXPERT
	- next - Test Configuration - next
	- Selecionar o item "AdminServer" - Finish

- Configurar as filas JMS no Weblogic
	- Menu "Services" - "Messaging" - "JMS Servers" - New
		- Name = SoaExpertServer
	- next
		- Target = AdminServer
	- finish 

	- Menu "Services" - "Messaging" - "JMS Modules" - New
		- Name = SoaExpertModule
	- next
	- Selecionar o item "AdminServer" - next - finish

	- clicar em "SoaExpertModule"
	- Aba "Subdeployments" - new
		- Subdeployment Name = SoaExpertSub
	- next
	- marcar o item "SoaExpertServer" - Finish

	- Aba "Configuration"
	- new
	- Selecionar "Connection Factory" - next
		- Name = SoaExpertCF
		- JNDI Name = SoaExpertCF
		- Desmarcar "XA Connection Factory Enabled"
	- next - Advanced Targeting
	- no campo "Subdeployments" selecionar "SoaExpertSub" - Finish

	- new
	- Selecionar "Queue" - next
		- Name = AprovaEmpresaQueue
		- JNDI Name = AprovaEmpresaQueue
	- next
	- no campo "Subdeployments" selecionar "SoaExpertSub" - Finish

	- new
	- Selecionar "Queue" - next
		- Name = ReprovaEmpresaQueue
		- JNDI Name = ReprovaEmpresaQueue
	- next
	- no campo "Subdeployments" selecionar "SoaExpertSub" - Finish


--------------------------------------------------------------------------------------

INSTALACAO DO ORACLE SOA SUITE
---------- -- ------ --- -----
Link para download:
http://www.oracle.com/technetwork/middleware/soasuite/downloads/index.html

Seguir documento de instalação
http://bit.ly/soasuitequickstartguide
ou
./docs/quickstartguidesoasuite11gr1ps4-459545.pdf


1 - Instalar o Oracle SOA Suite
Juntar os dois pacotes em uma pasta só e rodar o runInstaller da pasta disk1.

2 - Instalar o RCU
Importante: precisa setar isso na instalação do RCU!!
set RCU_JDBC_TRIM_BLOCKS=TRUE
echo %RCU_JDBC_TRIM_BLOCKS%

O RCU cria uma estrutura de tabelas que os produtos da Oracle vão usar (incluindo o SOA Suite)
3 - Criar um novo domínio no Weblogic (foi nomeado de "soa_domain")
~/Oracle/Middleware/wlserver_10.3/common/bin$ ./config.sh

4 - Iniciar o weblogic a partir do domínio soa_domain
~/Oracle/Middleware/user_projects/domains/soa_domain$ ./startWebLogic.sh

5 - Iniciar o enterprise manager
~/Oracle/Middleware/wlserver_10.3/server/bin$ ./startNodeManager.sh

6- Acessar o enterprise manager
http://localhost:7001/em/

7 - Iniciar o node manager
./docs/iniciar_node_manager.png

Obs: log do start:
tail -f /.../Oracle/Middleware/user_projects/domains/soa_domain/servers/soa_server1/logs/soa_server1.out

Obs: Da primeira vez vai dar problema de heap space..
8 - Parar o nome manager diretamente na linha de comando:
/.../Oracle/Middleware/user_projects/domains/soa_domain/bin$ ./stopManagedWebLogic.sh soa_server1

9 - Parar o weblogic

10 - Parar o enterprise manager

11 - Ediar o arquivo:
/home/fsoa42/Oracle/Middleware/wlserver_10.3/common/nodemanager/nodemanager.properties
mudar de:
StartScriptEnabled=false
para:
StartScriptEnabled=true

12 - Iniciar o weblogic

13 - Iniciar o enterprise manager

14 - Iniciar o node manager
Na segunda vez vai dar problema de file lock...

15 - Dar um kill no processo do soa_server1 (ps -ef | grep soa_server1)

16 - Iniciar o node manager
(esperar uns minutos)

