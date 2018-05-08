package uts.wsd;

import java.util.ArrayList;
import javax.xml.bind.annotation.XmlElement;

public class Books {
    @XmlElement(name = "books")
    private ArrayList<Book> books = new ArrayList<Book>();

    public ArrayList<Book> getList() {
        return books;
    }

    public void addBook(Book book) {
        books.add(book);
    }

    public void removeBook(Book book) {
        books.remove(book);
    }

    public Book getBook(String title) {
        for (Book book : books) {
            if (book.getTitle().equals(title)) {
                return book;
            }
        }
        return null;
    }
}
