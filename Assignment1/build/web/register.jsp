<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>

        <c:set var="container">
            <listers>
                <lister>
                    <email><label for="email">Email: </label></email>
                    <password><label for="password">Password: </label></password>
                </lister>
            </listers>
        </c:set>

<c:import url="register.xsl" var="stylesheet" />
<x:transform xml  = "${container}" xslt = "${stylesheet}" />        