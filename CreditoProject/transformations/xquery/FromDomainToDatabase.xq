(:: pragma bea:schema-type-parameter parameter="$empresa1" type="ns0:Empresa" location="../../Interfaces/Schemas/DomainModel.xsd" ::)
(:: pragma bea:global-element-return element="ns1:EmpresaPrimaryKey" location="../../Adapters/JCA/xsd/EmpresaService_table.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/top/EmpresaService";
declare namespace ns0 = "http://soaexpert.com.br/domain";
declare namespace xf = "http://tempuri.org/CreditoProject/transformations/xquery/FromDomainToDatabase/";

declare function xf:FromDomainToDatabase($empresa1 as element())
    as element(ns1:EmpresaPrimaryKey) {
        <ns1:EmpresaPrimaryKey>
            <ns1:id>{ data($empresa1/ns0:id) }</ns1:id>
        </ns1:EmpresaPrimaryKey>
};

declare variable $empresa1 as element() external;

xf:FromDomainToDatabase($empresa1)
