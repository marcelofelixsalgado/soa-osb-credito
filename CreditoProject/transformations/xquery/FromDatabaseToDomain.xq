(:: pragma bea:global-element-parameter parameter="$empresaCollection1" element="ns1:EmpresaCollection" location="../../Adapters/JCA/xsd/EmpresaService_table.xsd" ::)
(:: pragma bea:global-element-return element="ns0:verificaCadastroResponse" location="../../Interfaces/WSDL/EmpresaService.wsdl" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/top/EmpresaService";
declare namespace ns0 = "http://soaexpert.com.br/EmpresaService/";
declare namespace xf = "http://tempuri.org/CreditoProject/transformations/xquery/FromDatabaseToDomain/";

declare function xf:FromDatabaseToDomain($empresaCollection1 as element(ns1:EmpresaCollection))
    as element(ns0:verificaCadastroResponse) {
        <ns0:verificaCadastroResponse>
            <status>{count($empresaCollection1/*:Empresa) > 0}</status>
        </ns0:verificaCadastroResponse>
};

declare variable $empresaCollection1 as element(ns1:EmpresaCollection) external;

xf:FromDatabaseToDomain($empresaCollection1)
