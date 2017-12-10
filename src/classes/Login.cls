global class Login{
    
    string outCallResultLogin;
  //  string sessionID;
    //String xmlOutput;
    
    public static String createCase(String sessionid,string xmlOutput) {
        
         Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://intresting-dev-ed.my.salesforce.com/services/Soap/c/40.0');
        req.setMethod('POST');
        //String varStatus = address.getChildElement('Status', null).getText();
        //system.debug(varStatus);
      //  String varstate = address.getChildElement('state', null).getText();     
        
        //URL basoapenvUrl = URL.getSalesforceBaseUrl();
       
        req.setHeader('Content-Type','text/xml'); 
        req.setHeader('SOAPAction', '""');
        string body = '<?xml version="1.0" encoding="UTF-8"?>'+
            '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:enterprise.soap.sforce.com" xmlns:urn1="urn:sobject.enterprise.soap.sforce.com">'+
            '<soapenv:Header>'+
            '<urn:SessionHeader>'+
            '<urn:sessionId>'+sessionid+'</urn:sessionId>'+
            '</urn:SessionHeader>'+
            '</soapenv:Header>'+
            '<soapenv:Body>'+
            '<urn:create>'+
            
            '<urn:sObjects xsi:type="urn1:Case" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">'+
          //  '<Status> '+varStatus+' </Status>'+
       //   '<Status> New </Status>'+
         //   '<Origin>Phone</Origin>'+
           // '<Subject>Created by WSDL</Subject>'+
              xmlOutput +          
            '</urn:sObjects>'+
            '</urn:create>'+
            '</soapenv:Body>'+
            '</soapenv:Envelope>';  
        
        req.setBody(body);
         HttpResponse res = h.send(req);
        return res.getBody();
        //return NULL;
    } 
    
    public static String doLogin(){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        
        //URL basoapenvUrl = URL.getSalesforceBaseUrl();
        req.setEndpoint('https://login.salesforce.com/services/Soap/c/40.0');
        req.setMethod('POST');
        req.setHeader('Content-Type','text/xml'); 
        req.setHeader('SOAPAction', '""');
        string body = '<?xml version="1.0" encoding="UTF-8"?>'+
            '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:enterprise.soap.sforce.com">'+
            '<soapenv:Header>'+
            '</soapenv:Header>'+
            '<soapenv:Body>'+
            '<urn:login>'+
            '<urn:username>archita.shrotriya@trainee.dev.com</urn:username>'+
            '<urn:password>thelostsymbol09ljxxmkXIwkpgCiLPelkZGP7T</urn:password>'+
            '</urn:login>'+
            '</soapenv:Body>'+
            '</soapenv:Envelope>';  
        
        req.setBody(body);
        HttpResponse res = h.send(req);
        string outCallResultLogin = '';
        Dom.Document result = res.getBodyDocument();
        Dom.XMLNode address = result.getRootElement();
        //system.debug(address);
        Dom.XmlNode[] nod = address.getChildElements();// ('userId',null).getText();
        return nod[0].getChildElements()[0].getChildElements()[0].getChildElements()[4].getText();
        
    }
    
    
    public static String getXml() {
        XmlStreamWriter w = new XmlStreamWriter();
        w.writeStartElement(null, 'Status', null);
        w.writeCharacters('Open');
        w.writeEndElement(); //end book
        
        w.writeStartElement(null, 'Origin', null);
        w.writeCharacters('Phone');
        w.writeEndElement(); //end book
        
        w.writeStartElement(null, 'Subject', null);
        w.writeCharacters('This will be the subject');
        w.writeEndElement(); //end book
        w.writeEndDocument();
        String xmlOutput = w.getXmlString();
        w.close();
        system.debug(xmlOutput);
        return xmlOutput;       
    }
    
}