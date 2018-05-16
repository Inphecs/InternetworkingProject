package uts.wsd;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="books")
public class Books {    
    @XmlElement(name="book")    
    private ArrayList<Book> books = new ArrayList<Book>();
    private ArrayList<Integer> copies = new ArrayList<>();  
    private ArrayList<Boolean> displaybooks = new ArrayList<>();
    
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
    
    public ArrayList<Boolean> getDisplayBooks(){
        Book previousBook = null;
        for(Book book1 : books){
            if(previousBook == null){
                previousBook = book1;
                displaybooks.add(Boolean.TRUE);
            }
            else if(book1.getTitle().equals(previousBook.getTitle()))
            {
                previousBook = book1;
                displaybooks.add(Boolean.FALSE);   
            }            
            else
            {
                previousBook = book1;
                displaybooks.add(Boolean.TRUE);
            }                
        }
        return displaybooks;
    }
    
    public ArrayList<Integer> getNoOfCopies(){        
        for(Book book1 : books){
            int noOfCopies = noOfCopy(book1);
            copies.add(noOfCopies);
        }
        return copies;
    }                
    
    private int noOfCopy(Book book1)
    {
        int count = 0;
        for(Book book2 : books){
            if(book1.getTitle().equals(book2.getTitle()))
                count++;
        }
        return count;
    }
}
