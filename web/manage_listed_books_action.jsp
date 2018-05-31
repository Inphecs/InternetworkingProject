<%@page import="uts.wsd.Book"%>
<%@page import="uts.wsd.Lister"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<% String booksFilePath = application.getRealPath("WEB-INF/books.xml");%>                    
<jsp:useBean id="booksApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="booksApp" property="booksFilePath" value="<%=booksFilePath%>"/>
</jsp:useBean>
<%
    String bookID = request.getParameter("bookID");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Books</title>
    </head>
    <body id="managebooks">     
        <div class="container">
            <%
                if (bookID != null) {
                    for (Book book : booksApp.getBooks().getList()) {
                        if (book.getId().equals(bookID)) {
                            booksApp.getBooks().removeBook(book);
                            booksApp.saveBooks();
                            break;
                        }
                    }

            %>
            <p>You have removed the selected book. Click <a href="manage_books.jsp">here </a> to go back. </p>  
            <%        } else {
            %>
            <p>Remove Fail. Try again! Click <a href="manage_books.jsp">here </a> to return to go back. </p>  
            <%
                }
            %>        
        </div>
    </body>    
    <%@include file="footer.jsp" %>
</html>