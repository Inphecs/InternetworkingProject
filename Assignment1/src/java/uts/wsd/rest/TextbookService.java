package uts.wsd.rest;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import uts.wsd.TextbookApplication;
import uts.wsd.Books;


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

    @GET
    @Path("textbooks")    
    @Produces(MediaType.APPLICATION_XML)
    public Books getBooks() throws JAXBException, IOException {
        return getBookApp().getBooks();
    }
}
