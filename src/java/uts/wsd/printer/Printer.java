package uts.wsd.printer;

import java.io.FileInputStream;
import java.io.PrintWriter;
import java.io.Writer;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

public abstract class Printer {

    public abstract void print(Node node, PrintWriter out);

    public void print(String filePath, Writer out) throws ParserConfigurationException, SAXException, java.io.IOException {
        print(filePath, new PrintWriter(out, true));
    }

    public void print(String filePath, PrintWriter out) throws ParserConfigurationException, SAXException, java.io.IOException {
        FileInputStream in = new FileInputStream(filePath);
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(in);
        Element root = document.getDocumentElement();
        print(root, out);
        out.flush();
    }
}
