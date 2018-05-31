package uts.wsd;

import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.*;

public class TextbookApplication implements Serializable {

    private String listersFilePath;
    private String booksFilePath;
    private String guestsFilePath;
    private String reservationsFilePath;
    private Listers listers;
    private Books books;
    private Guests guests;
    private Reservations reservations;

    public TextbookApplication() {
    }

    public TextbookApplication(String listersFilePath, String booksFilePath, String guestsFilePath, String reservationsFilePath, Listers listers, Books books, Guests guests, Reservations reservations) {
        super();
        this.listersFilePath = listersFilePath;
        this.booksFilePath = booksFilePath;
        this.guestsFilePath = guestsFilePath;
        this.listers = listers;
        this.books = books;
        this.guests = guests;
        this.reservations = reservations;
    }

    public String getListersFilePath() {
        return listersFilePath;
    }

    public String getBooksFilePath() {
        return booksFilePath;
    }

    public String getGuestsFilePath() {
        return guestsFilePath;
    }

    public String getReservationsFilePath() {
        return reservationsFilePath;
    }

    public Listers getListers() {
        return listers;
    }

    public Guests getGuests() {
        return guests;
    }

    public Books getBooks() {
        return books;
    }

    public Reservations getReservations() {
        return reservations;
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
        JAXBContext jc = JAXBContext.newInstance(Books.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.booksFilePath = booksFilePath;
        // Unmarshal the object from the file
        FileInputStream fin = new FileInputStream(booksFilePath);
        books = (Books) u.unmarshal(fin); // load "Books" object
        fin.close();
    }

    public void setGuestsFilePath(String guestsFilePath) throws JAXBException, FileNotFoundException, IOException {
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Guests.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.guestsFilePath = guestsFilePath;
        // Unmarshal the object from the file
        FileInputStream fin = new FileInputStream(guestsFilePath);
        guests = (Guests) u.unmarshal(fin); // load "Books" object
        fin.close();
    }

    public void setReservationsFilePath(String reservationsFilePath) throws JAXBException, FileNotFoundException, IOException {
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Reservations.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.reservationsFilePath = reservationsFilePath;
        // Unmarshal the object from the file
        FileInputStream fin = new FileInputStream(reservationsFilePath);
        reservations = (Reservations) u.unmarshal(fin); // load "Books" object
        fin.close();
    }

    public void saveBooks() {
        try {
            JAXBContext jc = JAXBContext.newInstance(Books.class);
            Marshaller m = jc.createMarshaller();
            m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            FileOutputStream fout = new FileOutputStream(booksFilePath);
            m.marshal(books, fout);
            fout.close();
        } catch (Exception ex) {
            Logger.getLogger(TextbookApplication.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void saveListers() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Listers.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(listersFilePath);
        m.marshal(listers, fout);
        fout.close();
    }

    public void saveGuests() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Guests.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(guestsFilePath);
        m.marshal(guests, fout);
        fout.close();
    }

    public void saveReservations() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Reservations.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(reservationsFilePath);
        m.marshal(reservations, fout);
        fout.close();
    }
}
