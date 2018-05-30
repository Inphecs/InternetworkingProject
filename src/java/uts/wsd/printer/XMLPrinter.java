package uts.wsd.printer;

import java.io.PrintWriter;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XMLPrinter extends Printer {

    public void print(Node node, PrintWriter out) {
        int type = node.getNodeType();
        String name = node.getNodeName();
        String value = node.getNodeValue();
        NamedNodeMap attrs = node.getAttributes();
        switch (type) {
            case Node.ELEMENT_NODE:
                out.print("<" + name);
                for (int i = 0; i < attrs.getLength(); i++) {
                    Node attr = attrs.item(i);
                    out.print(" " + attr.getNodeName()
                            + "=\"" + attr.getNodeValue() + "\"");
                }
                out.print(">");
                NodeList children = node.getChildNodes();
                for (int i = 0; i < children.getLength(); i++) {
                    Node child = children.item(i);
                    print(child, out);
                }
                out.print("</" + name + ">");
                break;
            case Node.TEXT_NODE:
                out.print(value);
                break;
        }
    }
}
