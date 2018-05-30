<%@page import="org.w3c.dom.Document"%>
<%@page import="java.io.File"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="uts.wsd.TextbookApplication"%>
<%@page import="uts.wsd.Listers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>

<% 
    String Name = (String)session.getAttribute("name");
    String Email = (String)session.getAttribute("email");
    String Password = (String)session.getAttribute("password");
    String Dob = (String)session.getAttribute("dob");
    
    String passwordError = (String)session.getAttribute("passwordError");
    String dobError = (String)session.getAttribute("dobError");    
    String pass = (String)session.getAttribute("pass");
%>
        <c:set var="container">
            <listers>
                <lister>
                     <%if(Name!= null && Email!=null && Password!=null &&Dob!=null)
                     { %>  
                    <name><%= Name %></name>
                    <email><%= Email %></email>
                    <password><%= Password %></password>
                    <dob><%= Dob  %></dob>                    
                    <% 
                        session.setAttribute("name", Name);
                        session.setAttribute("email", Email);
                        session.setAttribute("password", Password);
                        session.setAttribute("dob", Dob);
                    }
                    else
                    { %>
                    <name><%= lister.getName() %></name>
                    <email><%= lister.getEmail()%></email>
                    <password><%= lister.getPassword()%></password>
                    <dob><%= lister.getDob()%></dob>                        
                    <% 
                        session.setAttribute("name", lister.getName());
                        session.setAttribute("email", lister.getEmail());
                        session.setAttribute("password", lister.getPassword());
                        session.setAttribute("dob", lister.getDob());
                    }                                          
                    if(passwordError!=null){
                    %><passwordError><%=passwordError%></passwordError><% }
                    else if(dobError!=null){
                    %><dobError><%=dobError%></dobError><% }
                    else if(pass!=null){
                    %><pass><%=pass%></pass><%}%>                     
                </lister>
            </listers>
        </c:set>                    
<c:import url="edit_lister.xsl" var="stylesheet" />
<x:transform xml  = "${container}" xslt = "${stylesheet}" />      
<% String listersFilePath = application.getRealPath("WEB-INF/listers.xml"); %>                    
<jsp:useBean id="listersApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="listersApp" property="listersFilePath" value="<%=listersFilePath%>"/>
</jsp:useBean>
<%                                                                           
                        session.setAttribute("nameError", null);
                        session.setAttribute("emailError", null);
                        session.setAttribute("passwordError", null);                
                        session.setAttribute("dobError", null);
                        session.setAttribute("pass", null);
                        %>