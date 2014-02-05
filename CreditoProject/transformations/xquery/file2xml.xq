(:: pragma bea:mfl-element-parameter parameter="$loteEmpresa1" type="LoteEmpresa@" location="../../resources/LoteEmpresa.mfl" ::)
(:: pragma bea:schema-type-return type="ns0:LoteEmpresa" location="../../Interfaces/Schemas/DomainModel.xsd" ::)

declare namespace ns0 = "http://soaexpert.com.br/domain";
declare namespace xf = "http://tempuri.org/CreditoProject/transformations/xquery/file2xml/";

declare function xf:file2xml($loteEmpresa1 as element())
    as element() {
        <ns0:LoteEmpresa>
            <ns0:id>{ xs:integer($loteEmpresa1/id) }</ns0:id>
            {
                for $Empresa in $loteEmpresa1/Empresa
                return
                    <ns0:empresa>
                        <ns0:id>{ xs:integer($Empresa/codigo) }</ns0:id>
                        <ns0:razaoSocial>{ data($Empresa/nome) }</ns0:razaoSocial>
                        <ns0:nomeFantasia>{ data($Empresa/nomeFantasia) }</ns0:nomeFantasia>
                        <ns0:cnpj>{ data($Empresa/cnpj) }</ns0:cnpj>
                        <ns0:telefone>{ xs:integer($Empresa/tel) }</ns0:telefone>
                    </ns0:empresa>
            }
        </ns0:LoteEmpresa>
};

declare variable $loteEmpresa1 as element() external;

xf:file2xml($loteEmpresa1)
