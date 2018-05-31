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
                Lister getLister = (Lister) session.getAttribute("lister");
                String listerName = getLister.getName();

                for (Book book : booksApp.getBooks().getList()) {
                    if (book.getLister().equals(listerName)) {
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
            <% }
            }%>
        </books> 
    </c:set>
    <c:import url="manage_listed_books.xsl" var="stylesheet" />
    <x:transform xml  = "${container}" xslt = "${stylesheet}" />                                     
    <%@include file="footer.jsp" %>
</html>