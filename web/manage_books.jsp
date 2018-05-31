<%@page import="java.util.ArrayList"%>
<%@page import="uts.wsd.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<%  String booksFilePath = application.getRealPath("WEB-INF/books.xml");%>
<jsp:useBean id="booksApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="booksApp" property="booksFilePath" value="<%=booksFilePath%>"/>
</jsp:useBean>
<html>
    <c:set var="container">
        <books>
            <%
                ArrayList<Book> books = booksApp.getBooks().getList();

                for (Book book : books) {
            %>                                 
            <book>
                <id><%=book.getId()%></id>
                <title><%=book.getTitle()%></title>
                <author><%= book.getAuthor()%></author>
                <category><%= book.getCategory()%></category>
                <Abstract><%= book.getAbstract()%></Abstract>
                <isbn><%= book.getISBN()%></isbn>
                <publishername><%= book.getPublisherName()%></publishername>
                <year><%= book.getYear()%></year>
                <condition><%= book.getCondition()%></condition>
                <lister><%= book.getLister()%></lister>
                <status><%= book.getStatus()%></status>         
            </book>           
            <%}%>
            <add></add>
        </books> 
    </c:set>
    <c:import url="manage_books.xsl" var="stylesheet" />
    <x:transform xml  = "${container}" xslt = "${stylesheet}" />                                     
    <div class="container" >
        <p style="text-align: center;">© 2018 Web Service Development. All rights reserved.</p>
    </div>
</html>