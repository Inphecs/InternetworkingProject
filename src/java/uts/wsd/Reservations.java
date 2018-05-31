package uts.wsd;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "reservations", namespace = "http://www.uts.edu.au/31284/wsd-books")
public class Reservations implements Serializable {

    @XmlElement(name = "reservation")
    private ArrayList<Reservation> reservations = new ArrayList<Reservation>();

    public ArrayList<Reservation> getReservations() {
        return reservations;
    }

    public void addReservation(Reservation reservation) {
        reservations.add(reservation);
    }
}
