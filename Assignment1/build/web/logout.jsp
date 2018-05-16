<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body id="logout">        
        <p>You have been logged out. Click here <a href="index.jsp" />
            to return to the main page. </p>
        <% session.invalidate();  finalize(); %>
        
    </body>
</html>