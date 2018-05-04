package uts.wsd;
import java.io.Serializable;
/**
 *
 * @author Choi
 */
public class Book implements Serializable {
    private String title;
    private String author;
    private double price;
    private int stock;
    public Book(){
        super();
    }
    public Book(String title, String author, double price, int stock){
        super();
        this.title = title;
        this.author = author;
        this.price = price;
        this.stock = stock;
    }
    public String getTitle(){
        return title;
    }
    public void setTitle(String title){
        this.title = title;
    }
    public String getAuthor(){
        return author;
    }
    public void setAuthor(String author){
        this.author = author;
    }
    public double getPrice(){
        return price;
    }
    public void setPrice(double price){
        this.price = price;
    }
    public int getStock(){
        return stock;
    }
    public void setStock(int stock){
        this.stock = stock;
    }
}