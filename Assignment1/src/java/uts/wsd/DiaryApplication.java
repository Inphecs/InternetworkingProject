/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;
import java.io.*;
import java.util.*;
import javax.xml.bind.*;
/**
 *
 * @author Choi
 */
public class DiaryApplication implements Serializable {
    private String filePath;
    private Users users;
    
    public DiaryApplication(){}
    
    public DiaryApplication(String filePath, Users users)
    {
        super();
        this.filePath = filePath;
        this.users = users;
    }
    
    public String getFilePath(){
        return filePath;
    }
    
    public Users getUsers(){
        return users;
    }
    public void saveUser(User user)
    {
        users.addUser(user);       
    }
    public void setFilePath(String filePath) throws Exception{
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller u = jc.createUnmarshaller();
        
        this.filePath = filePath;
        FileInputStream fin = new FileInputStream(filePath);
        users = (Users)u.unmarshal(fin);
        fin.close();    
    }
    public void saveUsers() throws JAXBException, IOException{        
        JAXBContext jc = JAXBContext.newInstance(User.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(users, fout);
        fout.close();
    }
    public void updateXML(Users users, String filePath) throws Exception{
        this.users = users;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(users, fout);
        fout.close();
    }
}
