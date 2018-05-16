<%@page import="java.util.ArrayList"%>
<%@page import="uts.wsd.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<%  String booksFilePath = application.getRealPath("WEB-INF/books.xml"); %>
<jsp:useBean id="bookApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="bookApp" property="booksFilePath" value="<%=booksFilePath%>"/>
</jsp:useBean>

<c:set var="container">
    <books>
           <%                
                String getTitle = request.getParameter("title");            
                ArrayList<Book> books = bookApp.getBooks().getList();
                for(Book book : books)
                {
                    if(book.getTitle().equals(getTitle))
                    {
           %>                                 
        <book>
            <title><%=book.getTitle() %></title>
            <author><%= book.getAuthor() %></author>
            <category><%= book.getCategory() %></category>
            <Abstract><%= book.getAbstract() %></Abstract>
            <isbn><%= book.getISBN() %></isbn>
            <publishername><%= book.getPublisherName() %></publishername>
            <year><%= book.getYear() %></year>
            <condition><%= book.getCondition() %></condition>
            <status><%= book.getStatus() %></status>         
        </book>           
        <%          }
                }         %>
    </books>
</c:set>
<c:import url="reserve_books.xsl" var="stylesheet" />
<x:transform xml  = "${container}" xslt = "${stylesheet}" />                                     