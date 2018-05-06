package uts.wsd;


import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "listers")
public class Listers implements Serializable {

    @XmlElement(name = "lister")
    private ArrayList<Lister> list = new ArrayList<Lister>();

    public ArrayList<Lister> getList() {
        return list;
    }

    public void addLister(Lister lister) {
        list.add(lister);
    }

    public void removeLister(Lister lister) {
        list.remove(lister);
    }

    public Lister login(String email, String password) {
        for (Lister lister : list) {
            if (lister.getEmail().equals(email) && lister.getPassword().equals(password)) {
                return lister;
            }
        }
        return null;
    }

    public boolean isEmailExisted(String email) {
        for (Lister lister : list) {
            if (lister.getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }
}
