<%@page import="uts.wsd.Validator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="uts.wsd.Lister"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<% String listersFilePath = application.getRealPath("WEB-INF/listers.xml");%>                    
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
        <div class="container">
            <%
                if (name != null && email != null && password != null && dob != null) {
                    Validator validator = new Validator();
                    Lister newLister = new Lister(name, email, password, dob);

                    if (listersApp.getListers().matchName(name)) {
                        session.setAttribute("nameError", "UserName exists");
                        session.setAttribute("emailError", null);
                        session.setAttribute("passwordError", null);
                        session.setAttribute("dobError", null);
                        response.sendRedirect("register.jsp");
                    } else if (listersApp.getListers().matchEmail(email)) {
                        session.setAttribute("emailError", "Email exists");
                        session.setAttribute("nameError", null);
                        session.setAttribute("passwordError", null);
                        session.setAttribute("dobError", null);
                        response.sendRedirect("register.jsp");
                    } else if (!validator.nameValidate(name)) {
                        session.setAttribute("nameError", "Name must be alphabetical");
                        session.setAttribute("emailError", null);
                        session.setAttribute("passwordError", null);
                        session.setAttribute("dobError", null);
                        response.sendRedirect("register.jsp");
                    } else if (!validator.emailValidate(email)) {
                        session.setAttribute("emailError", "Email must be like 'sth@email.com'");
                        session.setAttribute("nameError", null);
                        session.setAttribute("passwordError", null);
                        session.setAttribute("dobError", null);
                        response.sendRedirect("register.jsp");
                    } else if (!validator.passwordValidate(password)) {
                        session.setAttribute("passwordError", "Password must be alphanumeric and over 8 characters");
                        session.setAttribute("emailError", null);
                        session.setAttribute("nameError", null);
                        session.setAttribute("dobError", null);
                        response.sendRedirect("register.jsp");
                    } else if (!validator.dobValidate(dob)) {
                        session.setAttribute("dobError", "Dob must be like '1999-01-01'");
                        session.setAttribute("emailError", null);
                        session.setAttribute("passwordError", null);
                        session.setAttribute("nameError", null);
                        response.sendRedirect("register.jsp");
                    } else {
                        listersApp.getListers().addLister(newLister);
                        listersApp.saveListers();
                        session.setAttribute("lister", newLister);
                        response.sendRedirect("manage_books.jsp");
                    }
                }
            %>
        </div>
    </body>
    <%@include file="footer.jsp" %>
</html>