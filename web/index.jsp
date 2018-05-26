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
            // Set dropdown values based on query params. (Cosmetic change only)
            $(document).ready(function() {
                function getURLParameter(name) {
                      return decodeURIComponent((new RegExp('[?|&]' + name + '=' + 
                              '([^&;]+?)(&|#|;|$)').exec(location.search) || 
                              [null, ''])[1].replace(/\+/g, '%20')) || null;
                }                
                var status = getURLParameter('status');
                var condition = getURLParameter('condition');
                var lister = getURLParameter('lister');
                
                if (status !== null) {
                    document.getElementById("status").value = status;
                }
                if (condition !== null) {
                    document.getElementById("condition").value = condition;
                }           
                if (lister !== null) {
                    document.getElementById("lister").value = lister;
                }
            });        
            
               $('a').click(function(){
                    set document.getElementById('title').innerHTML;
            });
        </script>        
<%  String booksFilePath = application.getRealPath("WEB-INF/books.xml"); %>
<jsp:useBean id="booksApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="booksApp" property="booksFilePath" value="<%=booksFilePath%>"/>
</jsp:useBean>
        <div class="container">
            <h1>Book Reservation Home</h1>
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
