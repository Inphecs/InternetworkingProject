<%@page import="uts.wsd.Guests"%>
<%@page import="uts.wsd.Reservation"%>
<%@page import="uts.wsd.Book"%>
<%@page import="uts.wsd.Reservations"%>
<%@page import="uts.wsd.Guest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  String booksFilePath = application.getRealPath("WEB-INF/books.xml");
    String guestsFilePath = application.getRealPath("WEB-INF/guests.xml");
    String reservationsFilePath = application.getRealPath("WEB-INF/reservations.xml");%>
<jsp:useBean id="booksApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="booksApp" property="booksFilePath" value="<%=booksFilePath%>"/>
</jsp:useBean>
<jsp:useBean id="guestsApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="guestsApp" property="guestsFilePath" value="<%=guestsFilePath%>"/>
</jsp:useBean>    
<jsp:useBean id="reservationsApp" class="uts.wsd.TextbookApplication" scope="application">
    <jsp:setProperty name="reservationsApp" property="reservationsFilePath" value="<%=reservationsFilePath%>"/>
</jsp:useBean>
<html>
    <%@include file= "navbar.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserve Books Page</title>
    </head>
    <body id="reserve">
        <div class="container">
            <%
                String getUserName = request.getParameter("name");
                String getUserEmail = request.getParameter("email");
                String getBookId = request.getParameter("checkbox-selected");

                if (getUserName != null && getUserEmail != null && getBookId != null) {
                    Book book = booksApp.getBooks().getBookById(getBookId);
                    book.setStatus("Reserved");
                    booksApp.saveBooks();

                    Guests guests = guestsApp.getGuests();
                    Guest guest = new Guest(getUserName, getUserEmail);
                    if (guests.getGuest(getUserName, getUserEmail) == null) {
                        guests.addGuest(guest);
                        guestsApp.saveGuests();
                    }
                    if (guest != null) {
                        reservationsApp.getReservations().addReservation(new Reservation(book, guest));
                        reservationsApp.saveReservations();
                    }
            %><p>Your reservation has successfully been made! Click <a href="index.jsp">here</a> to go back.</p> <% } else {
            %><p>Reservation Fail. Try again</p> <%
                }
            %>
        </div>
    </body>
    <%@include file="footer.jsp" %>    
</html>
