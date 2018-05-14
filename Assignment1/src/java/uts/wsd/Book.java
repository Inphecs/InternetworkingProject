package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="book")
public class Book implements Serializable {
    @XmlElement(name = "id")
    private int id;
    @XmlElement(name = "title")
    private String title;
    @XmlElement(name = "author")
    private String author;
    @XmlElement(name = "category")
    private String category;
    @XmlElement(name = "Abstract")
    private String Abstract;
    @XmlElement(name = "isbn")
    private int isbn;
    @XmlElement(name = "publishername")
    private String publishername;
    @XmlElement(name = "year")
    private int year;
    @XmlElement(name = "condition")
    private String condition;
    @XmlElement(name = "status")
    private String status;

    public Book() {
        super();
    }

    public Book(int id, String title, String author, String category, String Abstract,
            int isbn, String publishername, int year, String condition, String status) {
        super();
        this.id = id;
        this.title = title;
        this.author = author;
        this.category = category;
        this.Abstract = Abstract;
        this.isbn = isbn;
        this.publishername = publishername;
        this.year = year;
        this.condition = condition;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAbstract() {
        return Abstract;
    }

    public void setAbstract(String Abstract) {
        this.Abstract = Abstract;
    }

    public int getISBN() {
        return isbn;
    }

    public void setISBN(int isbn) {
        this.isbn = isbn;
    }

    public String getPublisherName() {
        return publishername;
    }

    public void setPublisherName(String publishername) {
        this.publishername = publishername;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
