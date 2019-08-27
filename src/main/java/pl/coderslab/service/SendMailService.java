package pl.coderslab.service;

import javax.activation.DataHandler;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.util.ByteArrayDataSource;
import java.io.PrintWriter;
import java.util.Properties;

import static javax.xml.bind.DatatypeConverter.parseBase64Binary;

public class SendMailService {

    public static void sendMail(String from, String to, String sub,
                                String msg, String file, String fileName, String contentType, final String username, final String password) {

        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");


        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setText(msg);

            //Adding pdf attachment
            MimeBodyPart mimeBodyPart = new MimeBodyPart();
            Multipart multipart = new MimeMultipart();

            byte[] pdfBytes = parseBase64Binary(file);

            DataHandler dataHandler = new DataHandler(new ByteArrayDataSource(pdfBytes, contentType));
            mimeBodyPart.setDataHandler(dataHandler);
            mimeBodyPart.setFileName(fileName);

            multipart.addBodyPart(mimeBodyPart);
            message.setContent(multipart, "text/html");


            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}

