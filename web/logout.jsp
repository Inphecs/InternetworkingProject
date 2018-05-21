<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body id="logout">
        <div class="container">
            <p>You have been logged out. Click <a href="index.jsp">here </a> to return to the main page.</p>
        </div>                
<% session.invalidate();  finalize(); %>
        <%@include file="footer.jsp" %>
    </body>    
</html>