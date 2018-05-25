<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
        <c:set var="container">
            <listers>
                <lister>
                    <name><label for="name">Name: </label></name>
                    <email><label for="email">Email: </label></email>
                    <password><label for="password">Password: </label></password>
                    <dob><label for="dob">Dob: </label></dob>
                </lister>
            </listers>
        </c:set>
<c:import url="register.xsl" var="stylesheet" />
<x:transform xml  = "${container}" xslt = "${stylesheet}" />    
<%@include file="footer.jsp" %>