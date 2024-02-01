---
layout: post
title: "SOAP, UDDI e WSDL"
categories: [Arquitetura de Software, Arquitetura Orientada a Serviços]
tags: [Arquitetura Orientada a Serviços, Web Services, SOA, SOAP, UDDI, WSDL]
---

<!--toc:start-->

- [Tecnologias utilizadas para construção de serviços web](#tecnologias-utilizadas-para-construção-de-serviços-web)
  - [**S**imple **O**bject **A**ccess **P**rotocol (SOAP)](#simple-object-access-protocol-soap)
    - [Partes do SOAP](#partes-do-soap)
  - [**U**niversal **D**escription, **D**iscovery and **I**ntegration (UDDI)](#universal-description-discovery-and-integration-uddi)
    - [Categorias do UDDI](#categorias-do-uddi)
  - [**W**eb **S**ervices **D**escription **L**anguage (WSDL)](#web-services-description-language-wsdl)
    - [Partes do WSDL](#partes-do-wsdl)
  - [Referências](#referências)

 <!--toc:end-->

# Tecnologias utilizadas para construção de serviços web

Três tecnologias são bastante utilizadas na construção de serviços web:
[SOAP](#simple-object-access-protocol-soap), [UDDI](#universal-description-discovery-and-integration-uddi) e [WSDL](#web-services-description-language-wsdl).

## **S**imple **O**bject **A**ccess **P**rotocol (SOAP)

```xml
<?xml version="1.0"?>
<!-- Exemplo de SOAP -->

<soap:Envelope
xmlns:soap="http://www.w3.org/2003/05/soap-envelope/"
soap:encodingStyle="http://www.w3.org/2003/05/soap-encoding">

<soap:Header>
...
</soap:Header>

<soap:Body>
...
  <soap:Fault>
  ...
  </soap:Fault>
</soap:Body>

</soap:Envelope>
```

SOAP significa: **S**imple **O**bject **A**ccess **P**rotocol, uma tradução simples SOAP significa: Protocolo Simples de acesso a objetos.
SOAP é um protocolo a nível de aplicação baseado em **XML** e agnóstico de sistemas operacionais e qualquer outra plataforma. A sua adoção
é recomenda pela [W3C](https://www.w3.org/TR/soap/).

### Partes do SOAP

Um **SOAP** deve conter **obrigatoriamente** as seguintes tags: `<soap:Envelope>`, `<soap:Body>`. Em caso de erro o provedor do serviço pode **opcionalmente** utilizar a
tag `<soap:Fault>` para informar o ocorrido. O provedor do serviço também pode, **opcionalmente**, enviar informações especificas do serviço através da tag `<soap:Header>`.

- A tag `<soap:Envelope>` é utilizada para sinalizar que o conteúdo da mensagem é um SOAP.

- A tag `<soap:Body>` possui em seu conteúdo informações relativas a chamada do serviço.

- A tag `<soap:Fault>` está contido dentro do body e possui informações relacionadas a algum erro.

- A tag `<soap:Header>` contem dados específicos do serviço, se o serviço for de autenticação então no header pode conter o token de acesso.

## **U**niversal **D**escription, **D**iscovery and **I**ntegration (UDDI)

Universal Description, Discovery and Integration é um serviço de diretório onde organizações podem registrar, buscar serviços Web.
Um serviço de registro, gerencia informação sobre provedores de serviços, implementações e metadados dos provedores. Um serviço de
registro deve fornecer uma interface para que provedores possam publicar o seus serviços e cliente de serviços possa descobrir serviços.

### Categorias do UDDI

UDDI descreve três categorias:

- páginas brancas: descrevem a organização como: nome, endereço contatos
- páginas amarelas: incluem as categorias, baseada em taxonomias padrões.
- páginas verdes: descrevem a interface para o serviço em nível de detalhe suficiente para se escrever uma aplicação possa usá-la

## **W**eb **S**ervices **D**escription **L**anguage (WSDL)

Web services description language ou linguagem de descrição de serviços web é uma linguagem baseada em **XML** que permite
com que os serviços web disponibilizem acesso a suas informações de forma padronizada e organizada.

### Partes do WSDL

WSDL possui 6 tags imporantes: types, _message_, _portType_, _binding_, _operation_, _definitions_:

- `<wsdl:types>`: É utilizado para informar os tipos de dados suportados pelo provedor do serviço.

- `<wsdl:message>`: Contém as informações dos padrões de entrada e saída dos dados do provedor do serviço.

- `<wsdl:portType>`: Contém as operações executadas pelo provedor do serviço.

- `<wsdl:binding>`: Contém as Informações sobre o protocolo de comunicação a ser utilizado com o provedor do serviço.

- `<wsdl:operation>`: Contém as assinaturas dos métodos disponibilizados pelo provedor do serviço.

- `<wsdl:definitions>`: utilizada para sinalizar que o conteúdo da mensagem é um WSDL

Um exemplo de WSDL para para Calculadora pode ser encontrada abaixo.

```xml
<!-- Exemplo de um WSDL de um serviço de calculadora -->
<wsdl:definitions
  xmlns:soap="https://schemas.xmlsoap.org/wsdl/soap/"
  xmlns:wsu="https://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"
  xmlns:soapenc="https://schemas.xmlsoap.org/soap/encoding/"
  xmlns:tns="https://Example.org"
  xmlns:wsa="https://schemas.xmlsoap.org/ws/2004/08/addressing"
  xmlns:wsp="https://schemas.xmlsoap.org/ws/2004/09/policy"
  xmlns:wsap="https://schemas.xmlsoap.org/ws/2004/08/addressing/policy"
  xmlns:xsd="https://www.w3.org/2001/XMLSchema"
  xmlns:msc="http://schemas.microsoft.com/ws/2005/12/wsdl/contract"
  xmlns:wsaw="https://www.w3.org/2006/05/addressing/wsdl"
  xmlns:soap12="https://schemas.xmlsoap.org/wsdl/soap12/"
  xmlns:wsa10="https://www.w3.org/2005/08/addressing"
  xmlns:wsx="https://schemas.xmlsoap.org/ws/2004/09/mex" targetNamespace="https://Example.org"
  xmlns:wsdl="https://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <xsd:schema targetNamespace="https://Example.org" elementFormDefault="qualified" >
  <xsd:element name="Add">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element minOccurs="0" name="a" type="xsd:int" />
        <xsd:element minOccurs="0" name="b" type="xsd:int" />
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>
  <xsd:element name="AddResponse">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element minOccurs="0" name="result" type="xsd:int" />
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>
  <xsd:element name="Subtract">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element minOccurs="0" name="a" type="xsd:int" />
        <xsd:element minOccurs="0" name="b" type="xsd:int" />
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>
  <xsd:element name="SubtractResponse">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element minOccurs="0" name="result" type="xsd:int" />
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>
    </xsd:schema>
  </wsdl:types>
  <wsdl:message name="ICalculator_Add_InputMessage">
    <wsdl:part name="parameters" element="tns:Add" />
  </wsdl:message>
  <wsdl:message name="ICalculator_Add_OutputMessage">
    <wsdl:part name="parameters" element="tns:AddResponse" />
  </wsdl:message>
  <wsdl:message name="ICalculator_Subtract_InputMessage">
    <wsdl:part name="parameters" element="tns:Subtract" />
  </wsdl:message>
  <wsdl:message name="ICalculator_Subtract_OutputMessage">
    <wsdl:part name="parameters" element="tns:SubtractResponse" />
  </wsdl:message>
  <wsdl:portType name="ICalculator">
    <wsdl:operation name="Add">
      <wsdl:input wsaw:Action="https://Example.org/ICalculator/Add" message="tns:ICalculator_Add_InputMessage" />
      <wsdl:output wsaw:Action="https://Example.org/ICalculator/AddResponse" message="tns:ICalculator_Add_OutputMessage" />
    </wsdl:operation>
    <wsdl:operation name="Subtract">
      <wsdl:input wsaw:Action="https://Example.org/ICalculator/Subtract" message="tns:ICalculator_Subtract_InputMessage" />
      <wsdl:output wsaw:Action="https://Example.org/ICalculator/SubtractResponse" message="tns:ICalculator_Subtract_OutputMessage" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="DefaultBinding_ICalculator" type="tns:ICalculator">
    <soap:binding transport="https://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="Add">
      <soap:operation soapAction="https://Example.org/ICalculator/Add" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="Subtract">
      <soap:operation soapAction="https://Example.org/ICalculator/Subtract" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="CalculatorService">
        <wsdl:port name="ICalculator" binding="tns:DefaultBinding_ICalculator">
            <soap:address location="https://Example.org/ICalculator" />
        </wsdl:port>
  </wsdl:service>
</wsdl:definitions>
```

## Referências

[W3Schools XML Soap][W3Schools]  
[WSDL Example][WSDL example]  
[O que é WSDL (Web Services Description Language)?](https://pt.stackoverflow.com/questions/29116/o-que-%c3%a9-wsdl-web-services-description-language)  
[Web Services e Arquitetura Orientada a Serviços](https://pauloricmarinho.gitbook.io/desenvolvimento/webservices/web-services-and-soa)

[W3Schools]: https://www.w3schools.com/xml/xml_soap.asp
[WSDL example]: https://learn.microsoft.com/en-us/windows/win32/wsw/calculatorwsdl?redirectedfrom=MSDN
