<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Action Page</title>
    </head>
    <body id="login">
        <div class="container">
            
<% String listersFilePath = application.getRealPath("WEB-INF/listers.xml"); %>                    
<jsp:useBean id="listersApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="listersApp" property="listersFilePath" value="<%=listersFilePath%>"/>
</jsp:useBean>
            <%                	               
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                Listers listers = listersApp.getListers();
                Lister listerLogin = listers.login(email, password);
                session.setAttribute("lister", listerLogin);
                if (listerLogin != null) {
                    response.sendRedirect("manage_books.jsp");
                } else {
            %>

            <p> Password incorrect. Click <a href="login.jsp">here</a> to try again.</p>
            <%
                }
            %>    
        </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
