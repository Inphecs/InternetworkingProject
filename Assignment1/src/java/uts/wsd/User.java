package uts.wsd;
import java.io.Serializable;
import javax.xml.bind.annotation.*;
/**
 *
 * @author Choi
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement
public class User implements Serializable {
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "password")
    private String password;
    @XmlElement(name = "gender")
    private String gender;
    @XmlElement(name = "favouriteColour")
    private String favouriteColour;
    public User(){
        super();
    }
    public User(String email, String name, String password, String gender, String favouriteColour){
        super();
        this.email = email;
        this.name = name;
        this.password = password;
        this.gender = gender;
        this.favouriteColour = favouriteColour;
    }
    public String getName(){
        return name;
    }
    
    public String getEmail(){
        return email;
    }
    
    public String getPassword(){
        return password;
    }
    
    public String getGender(){
        return gender;
    }
    
    public String getfavCol(){
        return favouriteColour;
    }
}