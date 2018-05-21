<%@page import="org.w3c.dom.Document"%>
<%@page import="java.io.File"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="uts.wsd.TextbookApplication"%>
<%@page import="uts.wsd.Listers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>

<% 
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String dob = request.getParameter("dob");
    
    if(name!=null && email!=null && password!=null && dob!=null){      
        session.setAttribute("name", name);
        session.setAttribute("email", email);
        session.setAttribute("password", password);
        session.setAttribute("dob", dob);
    }
    
    String Name = (String)session.getAttribute("name");
    String Email = (String)session.getAttribute("email");
    String Password = (String)session.getAttribute("password");
    String Dob = (String)session.getAttribute("dob");
%>
        <c:set var="container">
            <listers>
                <lister>
                    <%                                          
                     if(name==null && email==null && password==null && dob==null){     %>
                    <name><%= lister.getName() %></name>
                    <email><%= lister.getEmail()%></email>
                    <password><%= lister.getPassword()%></password>
                    <dob><%= lister.getDob()%></dob>
                  <% }
                     else if(Name!= null && Email!=null && Password!=null &&Dob!=null)
                     { %>  
                    <name><%= Name %></name>
                    <email><%= Email %></email>
                    <password><%= Password %></password>
                    <dob><%= Dob  %></dob>                    
                    <% } %>
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
                    if(name!=null && email!=null && password!=null && dob!=null){                        
                        listersApp.getListers().removeListerByEmail(email);
                        Lister modifiedLister = new Lister(name,email,password,dob); 
                        listersApp.getListers().addLister(modifiedLister);
                        session.setAttribute("name", name);
                        session.setAttribute("email", email);
                        session.setAttribute("password", password);
                        session.setAttribute("dob", dob);
                        session.setAttribute("lister", modifiedLister);
                        listersApp.saveListers();                        
                    }       
                        %>