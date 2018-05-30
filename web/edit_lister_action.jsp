<%@page import="uts.wsd.Validator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
        <title>Edit</title>
    </head>
    <body id="register">
        <div class="container">
            <p><%=name%></p>
            <p><%=email%></p>
            <p><%=password%></p>
            <p><%=dob%></p>
    <%
    if(name!=null && email!=null && password!=null && dob!=null){
        Validator validator = new Validator();
        if(!validator.passwordValidate(password)){
            session.setAttribute("name", name);
            session.setAttribute("email", email);
            session.setAttribute("password", null);
            session.setAttribute("dob", dob);            
            session.setAttribute("passwordError", "Password must be between 1 and 10 characters");
            session.setAttribute("emailError", null);
            session.setAttribute("nameError", null);
            session.setAttribute("dobError", null);
            response.sendRedirect("edit_lister.jsp");            
        }
        else if(!validator.dobValidate(dob)){
            session.setAttribute("name", name);
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            session.setAttribute("dob", null);            
            session.setAttribute("dobError", "Dob must be like '1999-01-01'");
            session.setAttribute("emailError", null);
            session.setAttribute("passwordError", null);
            session.setAttribute("nameError", null);
            response.sendRedirect("edit_lister.jsp");            
        }        
        else
        {
            session.setAttribute("name", name);
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            session.setAttribute("dob", dob);                        
            session.setAttribute("pass", "The account has been successfully updated");
            listersApp.getListers().removeListerByEmail(email);
            Lister modifiedLister = new Lister(name,email,password,dob); 
            session.setAttribute("lister", modifiedLister);
            listersApp.getListers().addLister(modifiedLister);
            listersApp.saveListers();                    
            response.sendRedirect("edit_lister.jsp");    
        }        
    }
%>
        </div>
    </body>
    <%@include file="footer.jsp" %>
</html>