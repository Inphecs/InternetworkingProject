/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;
import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;
/**
 *
 * @author Choi
 */
@XmlRootElement(name="users")
@XmlAccessorType(XmlAccessType.FIELD)
public class Users implements Serializable {
    @XmlElement(name="user")
    private ArrayList<User> list = new ArrayList<User>();
    
    public ArrayList<User> getList(){
        return list;
    }
    
    public void addUser (User user)
    {
        list.add(user);
    }
    
    public void removeUser(User user)
    {
        list.remove(user);
    }
    
    public User login(String email, String password)
    {
        for(User user: list)
        {
            if(user.getEmail().equals(email) && user.getPassword().equals(password))
                return user;
        }
        return null;
    }
    
    public boolean isEmailExisted(String email)
    {
        for(User user: list)
        {
            if(user.getEmail().equals(email))
                return true;
        }
        return false;        
    }
}
