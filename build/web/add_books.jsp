<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<link rel="stylesheet" type="text/css" href="styles/validator.css"/>
<%
    String titleError = (String)session.getAttribute("titleError");
    String authorError = (String)session.getAttribute("authorError");
    String abstractError = (String)session.getAttribute("abstractError");
    String isbnError = (String)session.getAttribute("isbnError");
    String publisherError = (String)session.getAttribute("publisherError");
    String yearError = (String)session.getAttribute("yearError");    
%>
<html>
        <c:set var="container">
            <books>
                <book>
                    <bookTitle><label for="bookTitle">Title: </label></bookTitle>
                    <author><label for="author">Author: </label></author>
                    <category><label for="category">Category: </label></category>
                    <Abstract><label for="Abstract">Abstract: </label></Abstract>
                    <isbn><label for="isbn">ISBN: </label></isbn>
                    <publisher><label for="publisher">Publisher: </label></publisher>
                    <year><label for="year">Year: </label></year>
                    <condition><label for="condition">Condition: </label></condition>
                    <%if(titleError!=null) {
                    %><titleError><%=titleError%></titleError><% }
                    else if(authorError!=null){
                    %><authorError><%=authorError%></authorError><% }
                    else if(abstractError!=null){
                    %><abstractError><%=abstractError%></abstractError><% }
                    else if(isbnError!=null){
                    %><isbnError><%=isbnError%></isbnError><% }                          
                    else if(publisherError!=null){
                    %><publisherError><%=publisherError%></publisherError><% }
                    else if(yearError!=null){
                    %><yearError><%=yearError%></yearError><% }%>                    
                </book>
            </books>
        </c:set>
<c:import url="add_books.xsl" var="stylesheet" />
<x:transform xml  = "${container}" xslt = "${stylesheet}" />
<%@include file="footer.jsp" %>
</html>