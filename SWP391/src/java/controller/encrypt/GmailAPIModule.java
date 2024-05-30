package controller.encrypt;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.googleapis.json.GoogleJsonError;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.gmail.Gmail;
import com.google.api.services.gmail.model.Message;
import org.apache.commons.codec.binary.Base64;

import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.*;
import java.nio.file.Paths;
import java.security.GeneralSecurityException;
import java.util.Properties;
import java.util.Set;

import static com.google.api.services.gmail.GmailScopes.GMAIL_SEND;

public class GmailAPIModule {

    private static final String CREATE_ACCOUNT_VERIFICATION_MESSAGE = "This is the verification code for creating your account. Please do not share with anybody else.\n\n\tYour verification code: ";
    private static final String RESET_PASSWORD_VERIFICATION_MESSAGE = "This is the verification code for resetting your password. Please do not share with anybody else.\n\n\tYour verification code: ";
    private static final String CREATE_ACCOUNT_SUBJECT = "Verification code";
    private static final String RESET_PASSWORD_SUBJECT = "Reset password verification code";
    private final Gmail service;

    public GmailAPIModule() throws GeneralSecurityException, IOException {
        NetHttpTransport netHttpTransport = GoogleNetHttpTransport.newTrustedTransport();
        GsonFactory gsonFactory = GsonFactory.getDefaultInstance();
        service = new Gmail.Builder(netHttpTransport, gsonFactory, getCredentials(netHttpTransport, gsonFactory))
                .setApplicationName("Gmail Test")
                .build();
    }

    private static final String FROM_EMAIL = "fakecms8@gmail.com";

    /**
     * Creates an authorized Credential object.
     *
     * @param netHttpTransport The network HTTP Transport.
     * @return An authorized Credential object.
     * @throws IOException If the credentials.json file cannot be found.
     */
    private static Credential getCredentials(final NetHttpTransport netHttpTransport, GsonFactory jsonFactory)
            throws IOException {
        // Load client secrets.
        InputStream in = GmailAPIModule.class.getResourceAsStream("/client_secret_711754884685-ra0qfgklh6couj850ji65k7sh912558t.apps.googleusercontent.com.json");
        if (in == null) {
            throw new FileNotFoundException("Resource not found: " + "/client_secret_711754884685-ra0qfgklh6couj850ji65k7sh912558t.apps.googleusercontent.com.json");
        }
        GoogleClientSecrets clientSecrets =
                GoogleClientSecrets.load(jsonFactory, new InputStreamReader(in));

        // Build flow and trigger user authorization request.
        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                netHttpTransport, jsonFactory, clientSecrets, Set.of(GMAIL_SEND))
                .setDataStoreFactory(new FileDataStoreFactory(Paths.get("tokens").toFile()))
                .setAccessType("offline")
                .build();
        LocalServerReceiver receiver = new LocalServerReceiver.Builder().setPort(8888).build();
        //returns an authorized Credential object.
        return new AuthorizationCodeInstalledApp(flow, receiver).authorize("user");
    }

    /**
     * Send email
     * @param subject SUBJECT of the email
     * @param message  message of the email
     * @param recipient recipient of the email
     * @throws Exception if the email cannot be sent
     */
    public void sendEmail(String subject, String message, String recipient) throws Exception {

        // Encode as MIME message
        Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);
        MimeMessage email = new MimeMessage(session);
        email.setFrom(new InternetAddress(FROM_EMAIL));
        email.addRecipient(javax.mail.Message.RecipientType.TO,
                new InternetAddress(recipient));
        email.setSubject(subject);
        email.setText(message);

        // Encode and wrap the MIME message into a gmail message
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        email.writeTo(buffer);
        byte[] rawMessageBytes = buffer.toByteArray();
        String encodedEmail = Base64.encodeBase64URLSafeString(rawMessageBytes);
        Message msg = new Message();
        msg.setRaw(encodedEmail);

        try {
            // Create send message
            msg = service.users().messages().send("me", msg).execute();
            System.out.println("Message id: " + msg.getId());
            System.out.println(msg.toPrettyString());
        } catch (GoogleJsonResponseException e) {
            // TODO(developer) - handle error appropriately
            GoogleJsonError error = e.getDetails();
            if (error.getCode() == 403) {
                System.err.println("Unable to send message: " + e.getDetails());
            } else {
                throw e;
            }
        }
    }

    public static void sendCreateAccountVerificationCode(String recipient, String verificationCode) {
        String msg = CREATE_ACCOUNT_VERIFICATION_MESSAGE + verificationCode;
        try {
            new GmailAPIModule().sendEmail(CREATE_ACCOUNT_SUBJECT,msg, recipient);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void sendResetPasswordVerificationCode(String recipient, String verificationCode) {
        String msg = RESET_PASSWORD_VERIFICATION_MESSAGE + verificationCode;
        try {
            new GmailAPIModule().sendEmail(RESET_PASSWORD_SUBJECT,msg, recipient);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        GmailAPIModule.sendCreateAccountVerificationCode("san282002@gmail.com", "123456");
    }


}