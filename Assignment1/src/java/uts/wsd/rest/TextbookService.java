package uts.wsd.rest;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.wsd.TextbookApplication;
import uts.wsd.Books;


@Path("/textbookApp")
public class TextbookService { //TODO: not sure why this warning is here.

    @Context
    private ServletContext application;

    private TextbookApplication getBookApp() throws JAXBException, IOException {
        synchronized (application) {
            TextbookApplication textbookApp = (TextbookApplication) application.getAttribute("diaryApp");
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
    public Books getBooks() throws JAXBException, IOException {
        TextbookApplication textbookApp = getBookApp();
        // call filter methods based on params... 
        return textbookApp.getBooks();
    }
}
