#Include "Totvs.ch"

/*/{Protheus.doc} TesteWs
(      Exemplo pratico da classe TWsdlManager  )
@type Class
@author Ruann Carlos
@since 03/05/2018
@version 1.0
@return ${return}, ${return_description}
@country Brasil
@database 11 - 12
@language PT-BR					
/*/
User Function TesteWs()

	Local oWsdl := TWsdlManager():New()
	
	If !oWsdl:ParseUrl("http://10.4.0.11:8099/INTEGRATIONCASAETERRA.apw?WSDL")
		Alert("Erro na conexao")
	Else
		If oWsdl:SetOperation( "CLIENTDATA" )
		
			_cSoap := '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://10.4.0.11:8099/">'
			_cSoap += '  <soapenv:Header/>'
			_cSoap += '   <soapenv:Body>'
			_cSoap += '      <ns:CLIENTDATA>'
			_cSoap += '         <ns:LOGINCLIENTDATA>'
			_cSoap += '            <ns:CPF>'+DecodeUTF8("73729531115")+'</ns:CPF>'
			_cSoap += '            <ns:PASSWORD>'+DecodeUTF8("25410013")+'</ns:PASSWORD>'
			_cSoap += '            <ns:TOKEN>'+DecodeUTF8("9e6b668bf84f6b99952e2f2feaa8bfbda02ec4c0")+'</ns:TOKEN>'
			_cSoap += '         </ns:LOGINCLIENTDATA>'
			_cSoap += '      </ns:CLIENTDATA>'
			_cSoap += '   </soapenv:Body>'
			_cSoap += '</soapenv:Envelope>'
				
			If oWsdl:SendSoapMsg( _cSoap )
				MsgInfo( oWsdl:GetSoapResponse() )
			Else
				Alert( oWsdl:cError )
			Endif 
			
		EndIf
	EndIf
	
Return