package uts.wsd;

import java.util.ArrayList;
import java.io.Serializable;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

@XmlRootElement(name = "books")
@XmlAccessorType(XmlAccessType.FIELD)
public class Books implements Serializable{
    @XmlElement(name = "book")
    private ArrayList<Book> list = new ArrayList<Book>();

    public ArrayList<Book> getList() {
        return list;
    }

    public void addBook(Book book) {
        list.add(book);
    }

    public void removeBook(Book book) {
        list.remove(book);
    }

    public Book getBook(String title) {
        for (Book book : list) {
            if (book.getTitle().equals(title)) {
                return book;
            }
        }
        return null;
    }
}
