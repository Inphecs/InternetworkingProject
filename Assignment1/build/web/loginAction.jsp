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
            
<% String listersFilePath = application.getRealPath("WEB-INF/listers.xml"); %>                    
<jsp:useBean id="listersBookApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="listersBookApp" property="listersFilePath" value="<%=listersFilePath%>"/>
</jsp:useBean>
            <%                	               
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                Listers listers = listersBookApp.getListers();
                Lister listerLogin = listers.login(email, password);
                session.setAttribute("lister", listerLogin);
                if (listerLogin != null) {
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
