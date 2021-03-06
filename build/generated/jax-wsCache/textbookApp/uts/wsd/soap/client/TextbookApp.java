
package uts.wsd.soap.client;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.11-b150120.1832
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "textbookApp", targetNamespace = "http://soap.wsd.uts/", wsdlLocation = "http://localhost:8080/SecondHandBooks-uts/textbookApp?wsdl")
public class TextbookApp
    extends Service
{

    private final static URL TEXTBOOKAPP_WSDL_LOCATION;
    private final static WebServiceException TEXTBOOKAPP_EXCEPTION;
    private final static QName TEXTBOOKAPP_QNAME = new QName("http://soap.wsd.uts/", "textbookApp");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://localhost:8080/SecondHandBooks-uts/textbookApp?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        TEXTBOOKAPP_WSDL_LOCATION = url;
        TEXTBOOKAPP_EXCEPTION = e;
    }

    public TextbookApp() {
        super(__getWsdlLocation(), TEXTBOOKAPP_QNAME);
    }

    public TextbookApp(WebServiceFeature... features) {
        super(__getWsdlLocation(), TEXTBOOKAPP_QNAME, features);
    }

    public TextbookApp(URL wsdlLocation) {
        super(wsdlLocation, TEXTBOOKAPP_QNAME);
    }

    public TextbookApp(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, TEXTBOOKAPP_QNAME, features);
    }

    public TextbookApp(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public TextbookApp(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns TextbookSOAP
     */
    @WebEndpoint(name = "TextbookSOAPPort")
    public TextbookSOAP getTextbookSOAPPort() {
        return super.getPort(new QName("http://soap.wsd.uts/", "TextbookSOAPPort"), TextbookSOAP.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns TextbookSOAP
     */
    @WebEndpoint(name = "TextbookSOAPPort")
    public TextbookSOAP getTextbookSOAPPort(WebServiceFeature... features) {
        return super.getPort(new QName("http://soap.wsd.uts/", "TextbookSOAPPort"), TextbookSOAP.class, features);
    }

    private static URL __getWsdlLocation() {
        if (TEXTBOOKAPP_EXCEPTION!= null) {
            throw TEXTBOOKAPP_EXCEPTION;
        }
        return TEXTBOOKAPP_WSDL_LOCATION;
    }

}
