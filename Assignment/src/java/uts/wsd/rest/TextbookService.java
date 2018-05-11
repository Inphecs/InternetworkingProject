package uts.wsd.rest;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.wsd.*;


@Path("/textbookApp")
public class TextbookService { //TODO: not sure why this warning is here.

    @Context
    private ServletContext application;

private TextbookApplication getTextbookApp() throws JAXBException, IOException, Exception
{
    synchronized (application) {
        TextbookApplication textbookApp = (TextbookApplication)application.getAttribute("textbookApp");
        if (textbookApp == null)
        {
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
    public Books getBooks() throws JAXBException, IOException, Exception {
        //TextbookApplication textbookApp = getBookApp();
        // call filter methods based on params... 
        return getTextbookApp().getBooks();
    }
    
    /*@GET
    @Produces(MediaType.APPLICATION_XML)
    @Path("textbooks/{title}")
    public Books getBook(@PathParam("title") String title) throws IOException, Exception
    {
        return getTextbookApp().getBooks().getBook(title);
    }*/
}