package uts.wsd.soap;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBException;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;
import uts.wsd.Books;
import uts.wsd.Book;
import uts.wsd.Lister;
import uts.wsd.TextbookApplication;

@WebService(serviceName = "textbookApp")
public class TextbookSOAP {
    
    @Resource
    private WebServiceContext context;
    
    @WebMethod
    public Books fetchBooks() {
        return getTextbookApp().getBooks();
    }
    
    @WebMethod
    public Lister login(String email, String password) {
        return getTextbookApp().getListers().login(email, password);
    } 
    
    @WebMethod
    public Book createBook(String title, String author, String category,
        String bookAbstract, String isbn, String publisherName, int year,
        String condition, String lister, String status) {
        TextbookApplication textbookApp = getTextbookApp();
        String id = textbookApp.getBooks().getBookIdByCategory(category); 
        return new Book(id, title, author, category, bookAbstract, isbn,
                publisherName, year, condition, lister, status);
    }

    @WebMethod
    public void addBook(Book book) {
        TextbookApplication textbookApp = getTextbookApp();
        textbookApp.getBooks().addBook(book);
        textbookApp.saveBooks();
    }
    
    @WebMethod 
    public Book getBookById(String id) {
        TextbookApplication textbookApp = getTextbookApp();
        return textbookApp.getBooks().getBookById(id);
    }
    
    @WebMethod
    public boolean deleteBook(String id) {
        TextbookApplication textbookApp = getTextbookApp();
        Book book = textbookApp.getBooks().getBookById(id);
        if (book != null && textbookApp.getBooks().removeBook(book)) {
            textbookApp.saveBooks();
            return true;
        }        
        return false;  
    }

    @WebMethod
    private TextbookApplication getTextbookApp() {
        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);

        synchronized (application) {
            try {
                TextbookApplication textbookApp = (TextbookApplication) application.getAttribute("textbookApp");
                if (textbookApp == null) {
                    textbookApp = new TextbookApplication();
                    textbookApp.setListersFilePath(application.getRealPath("WEB-INF/listers.xml"));
                    textbookApp.setBooksFilePath(application.getRealPath("WEB-INF/books.xml"));
                    application.setAttribute("textbookApp", textbookApp);
                }
                return textbookApp;
            } catch (IOException | JAXBException ex) {
                Logger.getLogger(TextbookSOAP.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        }
    }
}
