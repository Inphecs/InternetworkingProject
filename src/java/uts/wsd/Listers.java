package uts.wsd;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "listers")
public class Listers implements Serializable {

    @XmlElement(name = "lister")
    private ArrayList<Lister> listers = new ArrayList<Lister>();

    public ArrayList<Lister> getListers() {
        return listers;
    }

    public void addLister(Lister lister) {
        listers.add(lister);
    }

    public void removeListerByEmail(String email) {
        for(Lister lister : listers)
            if(lister.getEmail().equals(email))
            {
                listers.remove(lister);
                return;
            }        
    }

    public Lister login(String email, String password) {
        for (Lister lister : listers) {
            if (lister.getEmail().equals(email) && lister.getPassword().equals(password)) {
                return lister;
            }
        }
        return null;
    }

    public boolean isEmailExisted(String email) {
        for (Lister lister : listers) {
            if (lister.getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }
}
