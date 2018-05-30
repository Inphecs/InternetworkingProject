package uts.wsd.soap.client;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.ParserConfigurationException;
import org.xml.sax.SAXException;
import uts.wsd.printer.Printer;
import uts.wsd.printer.XMLPrinter;

public class TextbookClient {

    public static final Printer xml = new XMLPrinter();
    public static final PrintWriter out = new PrintWriter(new OutputStreamWriter(System.out), true);
    public static final Scanner reader = new Scanner(System.in);

    public static void main(String[] args) {
        TextbookApp locator = new TextbookApp();
        TextbookSOAP textbookApp = locator.getTextbookSOAPPort();
        TextbookClient textbookClient = new TextbookClient();
        textbookClient.runCLI(textbookApp);
    }

    private String getInput(String input) {
        System.out.print(input + ": ");
        return reader.nextLine().trim();
    }

    private void runCLI(TextbookSOAP textbookApp) {
        String choice = "";
        boolean validChoice = true;
        do {
            System.out.println("Select an option:");
            System.out.println("1: view all textbooks");
            System.out.println("2: list a book");
            System.out.println("3: delete a book");
            System.out.println("exit: - to exit");
            System.out.print("enter choice: ");
            choice = reader.nextLine().toLowerCase().trim();

            switch (choice) {
                case "1":
                    try {
                        xml.print("build/web/WEB-INF/books.xml", out);
                    } catch (IOException | ParserConfigurationException | SAXException ex) {
                        Logger.getLogger(TextbookClient.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
                case "2":
                    Lister lister = authenticateLister(textbookApp);
                    if (lister != null) {
                        listBook(textbookApp, lister);
                    }
                    break;
                case "3":
                    Lister lister2 = authenticateLister(textbookApp);
                    if (lister2 != null) {
                        deleteBook(textbookApp, lister2);
                    }
                    break;
                case "exit":
                    break;
                default:
                    validChoice = false;
                    break;
            }

            if (validChoice && !choice.equals("exit")) {
                System.out.println("\n---------------------------------");
                System.out.println("Press any key to view the options.");
                choice = reader.nextLine();
            }
        } while (!choice.equals("exit"));
        reader.close();
    }

    private Lister authenticateLister(TextbookSOAP textbookApp) {
        String email = getInput("Email");
        String password = getInput("Password");
        Lister lister = textbookApp.login(email, password);

        if (lister != null) {
            System.out.println("Logged in.");
        } else {
            System.out.println("Incorrect login details.");
        }
        return lister;
    }

    private void listBook(TextbookSOAP textbookApp, Lister lister) {
        String title = getInput("Book title");
        String author = getInput("Book author");
        String category = getInput("Book category");
        String bookAbstract = getInput("Book abstract");
        String isbn = getInput("Book ISBN");
        String publisherName = getInput("Book publisher");
        int year = 0;
        try {
            year = Integer.parseInt(getInput("Book year"));
        } catch (NumberFormatException ex) {
            Logger.getLogger(uts.wsd.soap.TextbookSOAP.class.getName()).log(Level.SEVERE, null, ex);
        }
        String condition = getInput("Book condition");
        String status = getInput("Book status");

        Book book = textbookApp.createBook(title, author, category, bookAbstract, isbn,
                publisherName, year, condition, lister.getEmail(), status);

        if (book != null) {
            textbookApp.addBook(book);
            System.out.println("Book successfully listed. ID: " + book.getId());
        } else {
            System.out.println("Failed to list book. Invalid book details.");
        }
    }

    private void deleteBook(TextbookSOAP textbookApp, Lister lister) {
        String id = getInput("Book ID");
        Book book = textbookApp.getBookById(id);
        if (book != null
                && book.getLister().equals(lister.getEmail())
                && textbookApp.deleteBook(id)) {
            System.out.println("Book successfully deleted.");
        } else {
            System.out.println("Cannot delete book. You are not the Author.");
        }
    }
}
