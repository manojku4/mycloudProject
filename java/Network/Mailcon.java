/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Network;

/**
 *
 * @author java4
 */
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailcon {

    public static boolean secretMail(String msg, String name, String email , String sub) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        // Assuming you are sending email from localhost
        Session session = Session.getInstance (props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("skiesbcadata@gmail.com", "System01");
                    }
                });

        System.out.println("Message   " + msg);
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(name));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));
            message.setSubject(sub);
            message.setText(msg);

            Transport.send(message);

            System.out.println("Done");
            return true;

        } catch (MessagingException e) {
            System.out.println(e);
            e.printStackTrace();
            return false;
            // throw new RuntimeException(e);
        }
    }

}