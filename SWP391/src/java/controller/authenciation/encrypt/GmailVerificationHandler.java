package controller.authenciation.encrypt;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;

public class GmailVerificationHandler {

    private static final String CREATE_ACCOUNT_VERIFICATION_MESSAGE = "This is the verification code for creating your account. Please do not share with anybody else.\n\n\tYour verification code: ";
    private static final String RESET_PASSWORD_VERIFICATION_MESSAGE = "This is the verification code for resetting your password. Please do not share with anybody else.\n\n\tYour verification code: ";
    private static final String CREATE_ACCOUNT_SUBJECT = "Verification code";
    private static final String RESET_PASSWORD_SUBJECT = "Reset password verification code";
    private static final String FROM_EMAIL = "cuonglmhe130386@fpt.edu.vn";
    private static final String APP_PASSWORD = "kzti nkhn oome knax";
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";

    private Session createSession(Properties pr) {
        return Session.getInstance(pr, new Authenticator() {
            @Override
            protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
                return new jakarta.mail.PasswordAuthentication(GmailVerificationHandler.FROM_EMAIL, GmailVerificationHandler.APP_PASSWORD);
            }
        });
    }
    private Properties setupMailProperties() {
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.host", SMTP_HOST);
        properties.setProperty("mail.smtp.port", SMTP_PORT);
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        return properties;
    }


    /**
     * Send email
     * @param subject SUBJECT of the email
     * @param message  message of the email
     * @param recipient recipient of the email
     * @throws Exception if the email cannot be sent
     */
    public void sendEmail(String subject, String message, String recipient) throws Exception {
        try {
            Properties pr = setupMailProperties();

            jakarta.mail.Message mess = new MimeMessage(createSession(pr));
            mess.setHeader("Content-type", "text/html; charset=UTF-8");
            mess.setFrom(new jakarta.mail.internet.InternetAddress(FROM_EMAIL));
            mess.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient, false));
            mess.setSubject(subject);
            mess.setText(message);
            Transport.send(mess);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void sendCreateAccountVerificationCode(String recipient, String verificationCode) {
        String msg = CREATE_ACCOUNT_VERIFICATION_MESSAGE + verificationCode;
        try {
            new GmailVerificationHandler().sendEmail(CREATE_ACCOUNT_SUBJECT,msg, recipient);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void sendResetPasswordVerificationCode(String recipient, String verificationCode) {
        String msg = RESET_PASSWORD_VERIFICATION_MESSAGE + verificationCode;
        try {
            new GmailVerificationHandler().sendEmail(RESET_PASSWORD_SUBJECT,msg, recipient);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        GmailVerificationHandler.sendCreateAccountVerificationCode("san282002@gmail.com", "123456");
    }


}