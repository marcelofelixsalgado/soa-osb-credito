(:: pragma bea:schema-type-parameter parameter="$empresa1" type="ns0:Empresa" location="../../Interfaces/Schemas/DomainModel.xsd" ::)
(:: pragma bea:global-element-return element="ns1:EmpresaCollection" location="../../Adapters/JCA/xsd/EmpresaService_table.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/top/EmpresaService";
declare namespace ns0 = "http://soaexpert.com.br/domain";
declare namespace xf = "http://tempuri.org/CreditoProject/transformations/xquery/CadastroFromDomainToDatabase/";

declare function xf:CadastroFromDomainToDatabase($empresa1 as element())
    as element(ns1:EmpresaCollection) {
        <ns1:EmpresaCollection>
            {
                let $Empresa := $empresa1
                return
                    <ns1:Empresa>
                        <ns1:razaoSocial>{ data($empresa1/ns0:razaoSocial) }</ns1:razaoSocial>
                        <ns1:nomeFantasia>{ data($empresa1/ns0:nomeFantasia) }</ns1:nomeFantasia>
                        <ns1:cnpj>{ data($empresa1/ns0:cnpj) }</ns1:cnpj>
                        <ns1:telefone>{ data($empresa1/ns0:telefone) }</ns1:telefone>
                    </ns1:Empresa>
            }
        </ns1:EmpresaCollection>
};

declare variable $empresa1 as element() external;

xf:CadastroFromDomainToDatabase($empresa1)
