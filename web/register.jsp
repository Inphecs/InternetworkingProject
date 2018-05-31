<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="styles/validator.css"/>
<%
    String nameError = (String) session.getAttribute("nameError");
    String emailError = (String) session.getAttribute("emailError");
    String passwordError = (String) session.getAttribute("passwordError");
    String dobError = (String) session.getAttribute("dobError");
%>
<%@include file="navbar.jsp" %>
<c:set var="container">
    <listers>
        <lister>
            <name><label for="name">Name: </label></name>
            <email><label for="email">Email: </label></email>
            <password><label for="password">Password: </label></password>
            <dob><label for="dob">Dob: </label></dob>
            <%if (nameError != null) {%>
            <nameError>
                <%=nameError%>
            </nameError>
            <% } else if (emailError != null) {%>
            <emailError>
                <%=emailError%>
            </emailError>
            <% } else if (passwordError != null) {%>
            <passwordError>
                <%=passwordError%>
            </passwordError>
            <% } else if (dobError != null) {%>
            <dobError>
                <%=dobError%>
            </dobError>
            <% }%>                    
        </lister>
    </listers>
</c:set>
<c:import url="register.xsl" var="stylesheet" />
<x:transform xml  = "${container}" xslt = "${stylesheet}" />    
<%@include file="footer.jsp" %>
<%
    session.setAttribute("nameError", null);
    session.setAttribute("emailError", null);
    session.setAttribute("passwordError", null);
    session.setAttribute("dobError", null);
%>