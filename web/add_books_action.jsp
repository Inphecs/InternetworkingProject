<%@page import="uts.wsd.Validator"%>
<%@page import="uts.wsd.Book"%>
<%@page import="uts.wsd.Lister"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<% String booksFilePath = application.getRealPath("WEB-INF/books.xml");%>                    
<jsp:useBean id="booksApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="booksApp" property="booksFilePath" value="<%=booksFilePath%>"/>
</jsp:useBean>
<%
    String bookTitle = request.getParameter("bookTitle");
    String author = request.getParameter("author");
    String category = request.getParameter("category");
    String Abstract = request.getParameter("Abstract");
    String isbn = request.getParameter("isbn");
    String publisher = request.getParameter("publisher");
    String listerName = lister.getName();
    String year = request.getParameter("year");
    String condition = request.getParameter("condition");
    String bookId = booksApp.getBooks().getBookIdByCategory(category);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Books</title>
    </head>
    <body id="add">     
        <div class="container">
            <%
                if (bookId != null && bookTitle != null && author != null && category != null && Abstract != null && publisher != null && isbn != null && year != null && listerName != null && condition != null) {
                    Validator validator = new Validator();

                    if (!validator.titleValidate(bookTitle)) {
                        session.setAttribute("titleError", "Title must be alphanumeric");
                        session.setAttribute("authorError", null);
                        session.setAttribute("abstractError", null);
                        session.setAttribute("isbnError", null);
                        session.setAttribute("yearError", null);
                        session.setAttribute("publisherError", null);
                        response.sendRedirect("add_books.jsp");
                    } else if (!validator.nameValidate(author)) {
                        session.setAttribute("authorError", "Author must be alphabetical");
                        session.setAttribute("titleError", null);
                        session.setAttribute("abstractError", null);
                        session.setAttribute("isbnError", null);
                        session.setAttribute("yearError", null);
                        session.setAttribute("publisherError", null);
                        response.sendRedirect("add_books.jsp");
                    } else if (!validator.abstractValidate(Abstract)) {
                        session.setAttribute("abstractError", "Abstract must be within 100 characters");
                        session.setAttribute("authorError", null);
                        session.setAttribute("titleError", null);
                        session.setAttribute("isbnError", null);
                        session.setAttribute("yearError", null);
                        session.setAttribute("publisherError", null);
                        response.sendRedirect("add_books.jsp");
                    } else if (!validator.isbnValidate(isbn)) {
                        session.setAttribute("isbnError", "ISBN must be like '123-12-12345-12-1'");
                        session.setAttribute("authorError", null);
                        session.setAttribute("titleError", null);
                        session.setAttribute("abstractError", null);
                        session.setAttribute("yearError", null);
                        session.setAttribute("publisherError", null);
                        response.sendRedirect("add_books.jsp");
                    } else if (!validator.publisherValidate(publisher)) {
                        session.setAttribute("publisherError", "Publisher must be alphabetical");
                        session.setAttribute("authorError", null);
                        session.setAttribute("abstractError", null);
                        session.setAttribute("isbnError", null);
                        session.setAttribute("yearError", null);
                        session.setAttribute("titleError", null);
                        response.sendRedirect("add_books.jsp");
                    } else if (!validator.yearValidate((String) year)) {
                        session.setAttribute("yearError", "Year must be 4 digits");
                        session.setAttribute("authorError", null);
                        session.setAttribute("abstractError", null);
                        session.setAttribute("isbnError", null);
                        session.setAttribute("publisherError", null);
                        session.setAttribute("titleError", null);
                        response.sendRedirect("add_books.jsp");
                    } else {
            %>
            <p>You have created a new book. Click <a href="manage_books.jsp">here </a> to go back. </p>
            <%
                    Book newBook = new Book(bookId, bookTitle, author, category, Abstract, isbn, publisher, Integer.parseInt(year), condition, listerName, "Available");
                    booksApp.getBooks().addBook(newBook);
                    booksApp.saveBooks();
                }
            } else {
            %>
            <p>Try again! Click <a href="manage_books.jsp">here </a>to go back. </p>  
            <%
                }
            %>        
        </div>
    </body>    
    <%@include file="footer.jsp" %>
</html>