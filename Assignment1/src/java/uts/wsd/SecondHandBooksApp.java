package uts.wsd;

import java.io.*;
import javax.xml.bind.*;

public class SecondHandBooksApp implements Serializable {

    private String filePath;
    private Listers listers;

    public SecondHandBooksApp() {
    }

    public SecondHandBooksApp(String filePath, Listers listers) {
        super();
        this.filePath = filePath;
        this.listers = listers;
    }

    public String getFilePath() {
        return filePath;
    }

    public Listers getListers() {
        return listers;
    }

    public void saveLister(Lister lister) {
        listers.addLister(lister);
    }

    public void setFilePath(String filePath) throws Exception {
        JAXBContext jc = JAXBContext.newInstance(Listers.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.filePath = filePath;
        FileInputStream fin = new FileInputStream(filePath);
        listers = (Listers) u.unmarshal(fin);
        fin.close();
    }

    public void saveListers() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Lister.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(listers, fout);
        fout.close();
    }

    public void updateXML(Listers listers, String filePath) throws Exception {
        this.listers = listers;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Listers.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(listers, fout);
        fout.close();
    }
}
