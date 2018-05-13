<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<c:set var="container">
    <books>
        <book>
            <title></title>
            <author></author>
            <category></category>            
        </book>
    </books>
</c:set>
<c:import url="bookList.xsl" var="stylesheet" />
<x:transform xml  = "${container}" xslt = "${stylesheet}" />                                     