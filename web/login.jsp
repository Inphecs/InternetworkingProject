<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<link rel="stylesheet" type="text/css" href="styles/validator.css"/>	
<%
    String emailError = (String) session.getAttribute("emailError");
    String passwordError = (String) session.getAttribute("passwordError");
%>
<html>
    <c:set var="container">
        <listers>
            <lister>
                <email><label for="email">Email: </label></email>
                <password><label for="password">Password: </label></password>
                    <%if (emailError != null) {%>
                <emailError><%=emailError%></emailError>
                    <% } else if (passwordError != null) {%>
                <passwordError><%=passwordError%></passwordError>
                    <% } %>
            </lister>
        </listers>
    </c:set>
    <c:import url="login.xsl" var="stylesheet" />
    <x:transform xml  = "${container}" xslt = "${stylesheet}" />   
    <%@include file="footer.jsp" %>
    <%
        session.setAttribute("emailError", null);
        session.setAttribute("passwordError", null);
    %>
</html>