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
- Oracle XE 11.2.0 (oracle-xe-11.2.0-1.0.x86_64.rpm.zip)

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
