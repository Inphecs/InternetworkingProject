<%@page import="uts.wsd.Lister"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<link rel="stylesheet" type="text/css" href="styles/bookList.css"/>	
<link rel="stylesheet" type="text/css" href="styles/navBar.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<% Lister lister = (Lister)session.getAttribute("lister"); 
   String title = request.getParameter("title");    %>	        
<c:set var="container">
	<listers>
		<% if(lister != null) {%><lister><%=lister.getName() %></lister><% } 
                else{%><guest></guest><%} 
                if(title!=null){%><reserve></reserve><%}%>
	</listers>
</c:set>
<c:import url="navbar.xsl" var="xslt"/>
<x:transform xml="${container}" xslt="${xslt}"/>