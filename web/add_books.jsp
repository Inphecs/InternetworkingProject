<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
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
                </book>
            </books>
        </c:set>
<c:import url="add_books.xsl" var="stylesheet" />
<x:transform xml  = "${container}" xslt = "${stylesheet}" />
<%@include file="footer.jsp" %>
</html>