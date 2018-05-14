package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "guest")
public class Guest implements Serializable {

    @XmlElement(name = "username")
    private String username;
    @XmlElement(name = "email")
    private String email;

    public Guest() {
        super();
    }

    public Guest(String username, String email) {
        super();
        this.username = username;
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }
}
