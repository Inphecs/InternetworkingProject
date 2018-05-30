package uts.wsd;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "listers", namespace="http://www.uts.edu.au/31284/wsd-books")
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
    
    public boolean matchName(String name){
        for(Lister lister : listers) {
            if(lister.getName().equals(name))
                return true;
        }
        return false;
    }    

    public boolean matchEmail(String email){
        for(Lister lister : listers) {
            if(lister.getEmail().equals(email))
                return true;
        }
        return false;
    }
    
    public boolean matchPassword(String email, String password){
        for(Lister lister: listers){
            if(lister.getEmail().equals(email)&&lister.getPassword().equals(password)){
                return true;
            }
        }
        return false;
    }
}
