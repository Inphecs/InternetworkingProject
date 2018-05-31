package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
public class Reservation implements Serializable {

    @XmlElement(name = "book")
    private Book book;
    @XmlElement(name = "guest")
    private Guest guest;

    public Reservation() {
        super();
    }

    public Reservation(Book book, Guest guest) {
        super();
        this.book = book;
        this.guest = guest;
    }

    public Book getBook() {
        return book;
    }

    public Guest getGuest() {
        return guest;
    }
}
