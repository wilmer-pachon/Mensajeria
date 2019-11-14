<%-- 
    Document   : index
    Created on : 14/11/2019, 08:43:10 AM
    Author     : wilme
--%>
<%@page import="javax.jms.MessageProducer"%>
<%@page import="javax.jms.Queue"%>
<%@page import="javax.jms.Session"%>
<%@page import="javax.jms.Connection"%>
<%@page import="javax.jms.QueueConnectionFactory"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    Mensaje JMS<br/>
    <body>
        <%
         //cliente que envia el mensaje para colocar el mensaje en la cola
        try {
                InitialContext context = new InitialContext();
                
                QueueConnectionFactory cF =
                        (QueueConnectionFactory)context.lookup("jms/QueueFactoryTest"); //
                Queue queue = (Queue)context.lookup("jms/QueueTest"); //el destino dond esta el mensaje
                
                Connection cnn  = cF.createConnection();
                Session sess = cnn.createSession(false,Session.AUTO_ACKNOWLEDGE);
                MessageProducer messProd= 
                        sess.createProducer(queue);
                
                messProd.send(sess.createTextMessage("Hola a todos"));
                messProd.close();
                sess.close();
                cnn.close();
                out.println("El mensaje se envio correctamente");
                
        }catch (Exception e){
            out.println("No fue posible enviar el mensaje:"+e.getMessage());
        }
        
        
        %>
    </body>
</html>
