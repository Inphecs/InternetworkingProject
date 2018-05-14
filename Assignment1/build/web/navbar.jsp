<%@page import="uts.wsd.Lister"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="styles/bookList.css"/>	
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>                
        <%
            Lister navbarLister = (Lister) session.getAttribute("lister");
        %>	

        <c:set var="container">
        <listers>
            <% if (navbarLister != null) {%>

            <lister><%=navbarLister.getEmail()%></lister>

            <% } else {%>

            <guest></guest>

            <%}%>
        </listers>
        </c:set>
        <c:import url="navbar.xsl" var="xslt"/>
        <x:transform xml="${container}" xslt="${xslt}"/>
    </body>
</html>