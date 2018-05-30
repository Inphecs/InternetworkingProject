<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body id="logout">
            <% session.invalidate();  finalize(); 
               response.sendRedirect("index.jsp");
            %>
            
        <%@include file="footer.jsp" %>
    </body>    
</html>