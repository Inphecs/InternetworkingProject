package uts.wsd;

import java.util.ArrayList;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "books", namespace = "http://www.uts.edu.au/31284/wsd-books")
public class Books {

    @XmlElement(name = "book")
    private ArrayList<Book> books = new ArrayList<Book>();

    public ArrayList<Book> getList() {
        return books;
    }

    public void addBook(Book book) {
        books.add(book);
    }

    public boolean removeBook(Book book) {
        return books.remove(book);
    }

    public Book getBook(String title) {
        for (Book book : books) {
            if (book.getTitle().equals(title)) {
                return book;
            }
        }
        return null;
    }

    public Book getBookById(String id) {
        for (Book book : books) {
            if (book.getId().equals(id)) {
                return book;
            }
        }
        return null;
    }

    public ArrayList<Boolean> getDisplayCopies(ArrayList<Integer> noOfCopies) {
        Integer[] noOfCategories = {0, 0, 0, 0, 0, 0, 0, 0};
        ArrayList<Integer> copiesNumber = noOfCopies;
        ArrayList<Boolean> displayCopies = new ArrayList<>(books.size());
        int count = 0;
        for (Book book : books) {
            String IdString = book.getCategory().substring(0, 2);
            if (copiesNumber.get(count) > 1) {
                if (IdString.equals("Hi")) {
                    noOfCategories[0] += 1;
                    if (noOfCategories[0] == 1) {
                        displayCopies.add(Boolean.TRUE);
                    } else if (noOfCategories[0] > 1) {
                        displayCopies.add(Boolean.FALSE);
                    }
                } else if (IdString.equals("Te")) {
                    noOfCategories[1] += 1;
                    if (noOfCategories[1] == 1) {
                        displayCopies.add(Boolean.TRUE);
                    } else if (noOfCategories[1] > 1) {
                        displayCopies.add(Boolean.FALSE);
                    }
                } else if (IdString.equals("Ge")) {
                    noOfCategories[2] += 1;
                    if (noOfCategories[2] == 1) {
                        displayCopies.add(Boolean.TRUE);
                    } else if (noOfCategories[2] > 1) {
                        displayCopies.add(Boolean.FALSE);
                    }
                } else if (IdString.equals("Bi")) {
                    noOfCategories[3] += 1;
                    if (noOfCategories[3] == 1) {
                        displayCopies.add(Boolean.TRUE);
                    } else if (noOfCategories[3] > 1) {
                        displayCopies.add(Boolean.FALSE);
                    }
                } else if (IdString.equals("Ph")) {
                    noOfCategories[4] += 1;
                    if (noOfCategories[4] == 1) {
                        displayCopies.add(Boolean.TRUE);
                    } else if (noOfCategories[4] > 1) {
                        displayCopies.add(Boolean.FALSE);
                    }
                } else if (IdString.equals("Ma")) {
                    noOfCategories[5] += 1;
                    if (noOfCategories[5] == 1) {
                        displayCopies.add(Boolean.TRUE);
                    } else if (noOfCategories[5] > 1) {
                        displayCopies.add(Boolean.FALSE);
                    }
                } else if (IdString.equals("En")) {
                    noOfCategories[6] += 1;
                    if (noOfCategories[6] == 1) {
                        displayCopies.add(Boolean.TRUE);
                    } else if (noOfCategories[6] > 1) {
                        displayCopies.add(Boolean.FALSE);
                    }
                } else if (IdString.equals("Mu")) {
                    noOfCategories[7] += 1;
                    if (noOfCategories[7] == 1) {
                        displayCopies.add(Boolean.TRUE);
                    } else if (noOfCategories[7] > 1) {
                        displayCopies.add(Boolean.FALSE);
                    }
                }
            } else {
                displayCopies.add(Boolean.TRUE);
            }
            count++;
        }

        return displayCopies;
    }

    public ArrayList<Integer> getNoOfCopies() {
        ArrayList<Integer> copies = new ArrayList<>();
        for (Book book1 : books) {
            int noOfCopies = noOfCopy(book1);
            copies.add(noOfCopies);
        }
        return copies;
    }

    private int noOfCopy(Book book1) {
        int count = 0;
        for (Book book2 : books) {
            if (book1.getTitle().equals(book2.getTitle())) {
                count++;
            }
        }
        return count;
    }

    public String getBookIdByCategory(String category) {
        String Id = category.substring(0, 2);
        int Idnumber = 0;
        for (Book book : books) {
            int IdLength = book.getId().length();
            if (book.getCategory().equals(category)) {
                Idnumber = Integer.parseInt(book.getId().substring(2, IdLength));
            }
        }
        Idnumber++;
        return Id + Idnumber;
    }
}
