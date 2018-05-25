package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
public class Lister implements Serializable {

    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "password")
    private String password;
    @XmlElement(name = "dob")
    private String dob;

    public Lister() {
        super();
    }

    public Lister(String name, String email, String password, String dob) {
        super();
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
    }

    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email){
        this.email = email;
    }

    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password){
        this.password = password;
    }

    public String getDob() {
        return dob;
    }        
    
    public void setDob(String dob){
        this.dob = dob;
    }
}
