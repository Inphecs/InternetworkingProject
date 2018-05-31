package uts.wsd.rest;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import java.util.ArrayList;
import uts.wsd.Book;
import uts.wsd.TextbookApplication;

@Path("/textbookApp")
public class TextbookService {

    @Context
    private ServletContext application;

    private TextbookApplication getBookApp() throws JAXBException, IOException {
        synchronized (application) {
            TextbookApplication textbookApp = (TextbookApplication) application.getAttribute("textbookApp");
            if (textbookApp == null) {
                textbookApp = new TextbookApplication();
                textbookApp.setBooksFilePath(application.getRealPath("WEB-INF/books.xml"));
                application.setAttribute("textbookApp", textbookApp);
            }
            return textbookApp;
        }
    }

    @Path("textbooks")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Book> getBooksList(
            @QueryParam("condition") String condition,
            @QueryParam("status") String status,
            @QueryParam("lister") String lister
    ) throws JAXBException, IOException {
        ArrayList<Book> filteredBooks = new ArrayList<Book>();
        for (Book book : getBookApp().getBooks().getList()) {
            if ((condition == null || book.getCondition().equalsIgnoreCase(condition))
                    && (status == null || book.getStatus().equalsIgnoreCase(status))
                    && (lister == null || book.getLister().equalsIgnoreCase(lister))) {
                filteredBooks.add(book);
            }
        }
        return filteredBooks;
    }
}
