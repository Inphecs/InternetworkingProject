<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="uts.wsd.TextbookApplication"%>
<%@page import="uts.wsd.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<html>
    <head>
        <title>Book Reservation Home Page</title>
    </head>
    <body id="home">        
        <script>
            // Set status dropdown values based on query param. (Cosmetic only)
            $(document).ready(function() {
                function getURLParameter(name) {
                    return decodeURIComponent((new RegExp('[?|&]' + name + '=' + 
                            '([^&;]+?)(&|#|;|$)').exec(location.search) ||
                            [null, ''])[1].replace(/\+/g, '%20')) || null;
                }
                var status = getURLParameter('status');
                if (status !== null) {
                    document.getElementById("status").value = status;
                }
            });
        </script>    
<%  String booksFilePath = application.getRealPath("WEB-INF/books.xml"); %>
<jsp:useBean id="booksApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="booksApp" property="booksFilePath" value="<%=booksFilePath%>"/>
</jsp:useBean>
        <div class="container">
            <h1>Book Reservation Home</h1>
            <form method="GET">
                <table>
                    <tbody>
                        <tr>
                            <th class="col-xs-4"><label for="status">Status</label></th>
                            <th class="col-xs-4"></th>
                        </tr>
                        <tr>
                            <td class="col-xs-4">
                                <select id="status" name="status" style="width: 100%">
                                    <option>All</option>
                                    <option>Reserved</option>
                                    <option>Not Reserved</option>
                                </select>
                            </td>
                            <td class="col-xs-4">
                                <button type="submit">filter</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>  
            <c:set var="container">               
            <%                
                ArrayList<Book> books = booksApp.getBooks().getList();
                ArrayList<Integer> noOfBooksList = booksApp.getBooks().getNoOfCopies();
                ArrayList<Boolean> displayBooks = booksApp.getBooks().getDisplayCopies(noOfBooksList);
                int count = 0;                
            %>                
            <books>                                                   
                <%
                for(Book book : books)
                {                    
                    if(displayBooks.get(count)){
                    %>                    
                    <book>
                        <id><%= book.getId() %> </id>
                        <title><%=book.getTitle() %></title>
                        <author><%= book.getAuthor() %></author>
                        <category><%= book.getCategory() %></category>
                        <copies><%= noOfBooksList.get(count) %></copies>
                    </book>
                    <% 
                    }
                count++;                      
                }
            %>
            </books>            
            </c:set>
            <c:import url="index.xsl" var="stylesheet" />
            <x:transform xml  = "${container}" xslt = "${stylesheet}" />                                     
        </div>
    </body>
    <%@include file="footer.jsp"%>
</html>