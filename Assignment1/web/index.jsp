<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="uts.wsd.TextbookApplication"%>
<%@page import="uts.wsd.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Reservation Home Page</title>
    </head>
    <body>
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
                
                if (status != null) {
                    document.getElementById("status").value = status;
                }
                if (condition != null) {
                    document.getElementById("condition").value = condition;
                }           
                if (lister != null) {
                    document.getElementById("lister").value = lister;
                }
            });
        </script>
        
<%  String booksFilePath = application.getRealPath("WEB-INF/books.xml"); %>

<jsp:useBean id="bookApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="bookApp" property="booksFilePath" value="<%=booksFilePath%>"/>
</jsp:useBean>


        <div class="container">
            <h1>Book Reservation Home</h1>
            <form method="GET">
                <table>
                    <tbody>
                        <tr>
                            <th class="col-xs-3"><label for="status">Status</label></th>
                            <th class="col-xs-3"><label for="condition">Condition</label></th>
                            <th class="col-xs-3"><label for="lister">Lister</label></th>
                            <th class="col-xs-3"></th>
                        </tr>
                        <tr>
                            <td class="col-xs-3">
                                <select id="status" name="status" style="width: 100%"> <!-- TODO: Add styles to style sheet. -->
                                    <option>All</option>
                                    <option>Reserved</option>
                                    <option>Not Reserved</option>
                                </select>
                            </td>
                            <td class="col-xs-3">
                                <select id="condition" name="condition" style="width: 100%">
                                    <option>All</option>
                                    <option>As New</option>
                                    <option>Good</option>
                                    <option>Fair</option>
                                    <option>Poor</option>
                                </select>
                            </td>
                            <td class="col-xs-3">
                                <select id="lister" name="lister" style="width: 100%"> <!-- TODO: Input? or Populated Drop-down? -->
                                    <option>All</option>
                                </select>
                            </td>
                            <td class="col-xs-3">
                                <button type="submit">filter</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>        
                <br />
                <br />
            <c:set var="container">
            <books>            
            <%                
                int count = 0;
                ArrayList<Book> books = bookApp.getBooks().getList();
                ArrayList<Integer> copies = bookApp.getBooks().getNoOfCopies();
                ArrayList<Boolean> listed = bookApp.getBooks().getAreListed();
                for(Book book : books)
                {   
                    %>                    
                    <book>
                        <title><%=book.getTitle() %></title>
                        <author><%= book.getAuthor() %></author>
                        <category><%= book.getCategory() %></category>
                        <copies><%= copies.get(count) %></copies>
                    </book>
                    <% 
                      }
                      count++;
                }
            %>
            </books>
            </c:set>
            <c:import url="bookList.xsl" var="stylesheet" />
            <x:transform xml  = "${container}" xslt = "${stylesheet}" />                                     
        </div>
    </body>
</html>
