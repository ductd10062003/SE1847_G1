package authenciation.encrypt;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncryptor {

    public static String generateSalt() {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(String.valueOf(System.currentTimeMillis()).getBytes());
            byte[] digest = md.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MD5 algorithm not found", e);
        }
    }

    public static String generateSecurePassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            md.update(password.getBytes());
            byte[] digest = md.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MD5 algorithm not found", e);
        }
    }

    public static boolean validatePassword(String password, String encryptedPassword) {
        String hashedPassword = generateSecurePassword(password);
        return hashedPassword.equals(encryptedPassword);
    }

    public static void main(String[] args) {
        System.out.println(generateSalt());
    }
}