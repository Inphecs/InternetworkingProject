package uts.wsd;

import java.io.*;
import javax.xml.bind.*;

public class TextbookApplication implements Serializable {

    private String listersFilePath;
    private String booksFilePath;
    private Listers listers;
    private Books books;

    public TextbookApplication() {
        super();
        System.out.println(" We here in the no mans constructor");
    }

    public TextbookApplication(String listersFilePath, String booksFilePath, Listers listers, Books books) {
        super();
        System.out.println(" We here in the gooood contructor");
        this.listersFilePath = listersFilePath;
        this.booksFilePath = booksFilePath;
        this.listers = listers;
        this.books = books;
    }

    public String getListersFilePath() {
        return listersFilePath;
    }

    public String getBooksFilePath() {
        System.out.println(" We here in the getBooksFilePath method");
        return booksFilePath;
    }

    public Listers getListers() {
        return listers;
    }

    public Books getBooks() {
        System.out.println(" We here in the getBooks method. Books = " + books);
        return books;
    }
    
//Info:   We here in the no mans constructor
//Info:   We here in the setBooksFilePath method
//Info:   We here in the getBooks method. Books = uts.wsd.Books@b812b28
//Info:   We here in the getBooks method. Books = uts.wsd.Books@b812b28

//Info:   We here in the no mans constructor
//Info:   We here in the getBooks method. Books = null

    public void saveLister(Lister lister) {
        listers.addLister(lister);
    }

    public void saveBook(Book book) {
        books.addBook(book);
    }

    public void setListersFilePath(String listersFilePath) throws JAXBException, FileNotFoundException, IOException {
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Listers.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.listersFilePath = listersFilePath;
        // Unmarshal the object from the file
        FileInputStream fin = new FileInputStream(listersFilePath);
        listers = (Listers) u.unmarshal(fin); // load "Listers" object
        fin.close();
    }

    public void setBooksFilePath(String booksFilePath) throws JAXBException, FileNotFoundException, IOException {
        // Create the unmarshaller
        System.out.println(" We here in the setBooksFilePath method");
        JAXBContext jc = JAXBContext.newInstance(Books.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.booksFilePath = booksFilePath;
        // Unmarshal the object from the file
        FileInputStream fin = new FileInputStream(booksFilePath);
        books = (Books) u.unmarshal(fin); // load "Books" object
        fin.close();
    }

    public void saveBooks() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Book.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(booksFilePath);
        m.marshal(books, fout);
        fout.close();
    }

    public void updateBooksXML(Books books, String booksFilePath) throws Exception {
        this.books = books;
        this.booksFilePath = booksFilePath;
        JAXBContext jc = JAXBContext.newInstance(Books.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(booksFilePath);
        m.marshal(books, fout);
        fout.close();
    }
}
