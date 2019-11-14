/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jmsprueba;

import javax.ejb.ActivationConfigProperty;
import javax.ejb.MessageDriven;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;
/**
 *
 * @author wilme
 */
@MessageDriven(mappedName = "jms/QueueTest", activationConfig = { //se encarga de procesar los mensajes que llegan de la cola
    @ActivationConfigProperty(propertyName = "acknowledgeMode", propertyValue = "Auto-acknowledge"),
    @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue")
})

public class TestMessageBean implements MessageListener {
    
    public TestMessageBean() {
    }
   
    @Override
    public void onMessage(Message message) {
        try { 
            System.out.println("El mensaje enviado es:"+ ((TextMessage)message).getText()); 
        } catch (JMSException ex) {
          System.out.println("Erro en el mensaje");
        }  
    }
}