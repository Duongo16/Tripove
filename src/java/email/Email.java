package email;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.DataHandler;
import javax.activation.DataSource;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Admin
 */
public class Email {

    //email: tripove.work@gmail.com
    //password: recl ryfo jrju aick
    final String from = "tripove.work@gmail.com";
    final String password = "reclryfojrjuaick";

    public void sendEmail(String to, String newPassword) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        //phiên làm việc
        Session session = Session.getInstance(props, auth);

        //send email:
        MimeMessage msg = new MimeMessage(session);
        try {
            //content style
            msg.addHeader("Content-type", "text/HTML;charset=UTF-8");
            //sender and receiver:
            msg.setFrom(new InternetAddress(from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            //email header:
            msg.setSubject("TRIPOVE: KHÔI PHỤC MẬT KHẨU CỦA BẠN","UTF-8");
            // email response:
            msg.setReplyTo(InternetAddress.parse(from, false));

            //email content:
            msg.setText("Mật khẩu mới: " + newPassword,"UTF-8");

            //send email:
            Transport.send(msg);

        } catch (Exception e) {
        }
    }

}
