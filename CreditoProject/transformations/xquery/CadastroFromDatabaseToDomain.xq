(:: pragma bea:global-element-parameter parameter="$empresaCollection1" element="ns2:EmpresaCollection" location="../../Adapters/JCA/xsd/EmpresaService_table.xsd" ::)
(:: pragma bea:global-element-return element="ns1:cadastraResponse" location="../../Interfaces/WSDL/EmpresaService.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/pcbpel/adapter/db/top/EmpresaService";
declare namespace ns1 = "http://soaexpert.com.br/EmpresaService/";
declare namespace ns0 = "http://soaexpert.com.br/domain";
declare namespace xf = "http://tempuri.org/CreditoProject/transformations/xquery/CadastroFromDatabaseToDomain/";

declare function xf:CadastroFromDatabaseToDomain($empresaCollection1 as element(ns2:EmpresaCollection))
    as element(ns1:cadastraResponse) {
        <ns1:cadastraResponse>
            {
                let $Empresa := $empresaCollection1/ns2:Empresa[1]
                return
                    <empresa>
                        <ns0:id>{ data($Empresa/ns2:id) }</ns0:id>
                        <ns0:razaoSocial>{ data($Empresa/ns2:razaoSocial) }</ns0:razaoSocial>
                        <ns0:nomeFantasia>{ data($Empresa/ns2:nomeFantasia) }</ns0:nomeFantasia>
                        <ns0:cnpj>{ data($Empresa/ns2:cnpj) }</ns0:cnpj>
                        <ns0:telefone>{ data($Empresa/ns2:telefone) }</ns0:telefone>
                    </empresa>
            }
        </ns1:cadastraResponse>
};

declare variable $empresaCollection1 as element(ns2:EmpresaCollection) external;

xf:CadastroFromDatabaseToDomain($empresaCollection1)
