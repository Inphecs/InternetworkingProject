package uts.wsd;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "guests")
public class Guests implements Serializable {

    @XmlElement(name = "guest")
    private ArrayList<Guest> guests = new ArrayList<Guest>();

    public ArrayList<Guest> getGuests() {
        return guests;
    }

    public void addGuest(Guest guest) {
        guests.add(guest);
    }

    public void removeGuest(Guest guest) {
        guests.remove(guest);
    }

    public Guest getGuest(String username, String email)
    {
        for(Guest guest : guests)
            if(guest.getUsername().equals(username)&&guest.getEmail().equals(email))
                return guest;
        return null;
    }
}
