package uts.wsd;

import java.io.*;
import javax.xml.bind.*;

public class TestJAXB implements Serializable {

    public static void main(String[] args) throws Exception {
        Listers listers = new Listers();
        listers.addLister(new Lister("Ryan Heise", "ryan@ryanheise.com", "blahblah", "02/05/1990"));
        listers.addLister(new Lister("Joe Bloggs", "joe@bloggs.com", "foobar", "01/11/1982"));
        JAXBContext jc = JAXBContext.newInstance(Listers.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        m.marshal(listers, System.out);
    }
}
