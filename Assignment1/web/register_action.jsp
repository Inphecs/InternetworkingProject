<%@page import="uts.wsd.Lister"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<% String listersFilePath = application.getRealPath("WEB-INF/listers.xml"); %>                    
<jsp:useBean id="listersApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="listersApp" property="listersFilePath" value="<%=listersFilePath%>"/>
</jsp:useBean>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String dob = request.getParameter("dob");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body id="register">        
        <p>You have created a new account. Click here <a href="index.jsp" />
            to return to the main page. </p>
    </body>
</html>
<%
    if(name!=null && email!=null && password!=null && dob!=null){
        Lister newLister = new Lister(name,email,password,dob);
        listersApp.getListers().addLister(newLister);
        listersApp.saveListers();
        session.setAttribute("lister", newLister);
    }
%>