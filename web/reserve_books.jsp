<%@page import="org.w3c.dom.Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.wsd.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<html>
    <head>
        <script>
            function selectOnlyThis(id) {
                var x = document.getElementsByClassName('checkbox-select');
                for (var i = 0; i < x.length; i++)
                {
                    x[i].checked = false;
                    x[i].setAttribute("name", "");
                }
                if (document.getElementById(id).checked === false)
                {
                    document.getElementById(id).checked = true;
                    document.getElementById(id).setAttribute("name", "checkbox-selected");
                } else {
                    document.getElementById(id).checked = false;
                    document.getElementById(id).setAttribute("name", "");
                }
                var container = document.getElementById("reservetable");
                if (container.style.display === "none") {
                    container.style.display = "block";
                }
            }
        </script>    
    </head>
    <%  String booksFilePath = application.getRealPath("WEB-INF/books.xml");%>
    <jsp:useBean id="booksApp" class="uts.wsd.TextbookApplication" scope="application">
        <jsp:setProperty name="booksApp" property="booksFilePath" value="<%=booksFilePath%>"/>
    </jsp:useBean>
    <%
               String getTitle = request.getParameter("title");
               ArrayList<Book> books = booksApp.getBooks().getList();  %>                 
    <c:set var="container">        
        <books>
            <%
                for (Book book : books) {
                    if (book.getTitle().equals(getTitle)) {%>                
            <book>
                <id><%= book.getId()%></id>
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
            </book><%
                    }
                }

            %>                
            <reserve>
                <name><label for="name">Name: </label></name>            
                <email><label for="email">Email: </label></email>
            </reserve>
        </books>
    </c:set>
    <c:import url="reserve_books.xsl" var="stylesheet" />
    <x:transform xml  = "${container}" xslt = "${stylesheet}" />
    <%@include file="footer.jsp" %>
</html>