<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Action Page</title>
    </head>
    <body>
        <div class="container">
            
            <jsp:useBean id="textbookApp" class="uts.wsd.TextbookApplication" scope="application"></jsp:useBean>
                        
            <%
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                
                Lister lister = textbookApp.getListers().login(email, password);

                if (lister != null) {
                    session.setAttribute("lister", lister);
                    response.sendRedirect("index.jsp");
                } else {
            %>

            <p> Password incorrect. Click <a href="login.jsp">here</a> to try again.</p>

            <%
                }
            %>    
            
        </div>
    </body>
</html>