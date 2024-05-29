package controller.encrypt;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.util.Base64;

public class Password {
/*
ALGORITHM: Specifies the cryptographic algorithm. PBKDF2WithHmacSHA1 is a widely used, secure choice for password hashing.
ITERATIONS: Number of iterations for the hash function. More iterations mean more security but slower performance.
KEY_LENGTH: Length of the generated hash. 256 bits is a good standard.
 */
    // Define the algorithm and parameters
    private static final String ALGORITHM = "PBKDF2WithHmacSHA1";
    private static final int ITERATIONS = 10000;
    private static final int KEY_LENGTH = 256; // bits

    /**
     * A salt is a random value added to the password before hashing to ensure that the same password results in different hashes.
     * @return byte[] a salt
     * @throws NoSuchAlgorithmException if the algorithm is not found
     */
    // Method to generate a salt
    public static byte[] generateSalt() throws NoSuchAlgorithmException {
        SecureRandom sr = SecureRandom.getInstanceStrong();
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        return salt;
    }

    // Method to hash the password with a given salt

    /**
     * PBEKeySpec: Specifies the password, salt, number of iterations, and key length.
     * SecretKeyFactory: Generates a hash from the key specification.
     * Base64 encoding: Converts the byte array to a string for easy storage.
     * @param password the password to hash
     * @param salt the salt to use
     * @return String the hashed password
     * @throws NoSuchAlgorithmException if the algorithm is not found
     * @throws InvalidKeySpecException if the key specification is invalid
     */
    public static String hashPassword(String password, byte[] salt)
            throws NoSuchAlgorithmException, InvalidKeySpecException {
        PBEKeySpec spec = new PBEKeySpec(password.toCharArray(), salt, ITERATIONS, KEY_LENGTH);
        SecretKeyFactory skf = SecretKeyFactory.getInstance(ALGORITHM);
        byte[] hash = skf.generateSecret(spec).getEncoded();
        return Base64.getEncoder().encodeToString(hash);
    }

    // Method to generate a hashed password with a salt

    /**
     * generateSalt(): Generates a new salt.
     * hashPassword(): Hashes the password with the salt.
     * String combination: Concatenates the Base64-encoded salt and hash, separated by a colon.
     * @param password the password to hash
     * @return String the hashed password
     * @throws NoSuchAlgorithmException if the algorithm is not found
     * @throws InvalidKeySpecException  if the key specification is invalid
     */
    public static String generateSecurePassword(String password) throws NoSuchAlgorithmException, InvalidKeySpecException {
        byte[] salt = generateSalt();
        String hashedPassword = hashPassword(password, salt);
        return Base64.getEncoder().encodeToString(salt) + ":" + hashedPassword;
    }

    // Method to validate the password

    /**
     * split(":"): Splits the stored string into salt and hash parts.
     * Base64 decoding: Converts the string back to a byte array.
     * hashPassword(): Rehashes the input password with the stored salt.
     * compare: Checks if the rehashed password matches the stored hash.
     * @param originalPassword the password to check
     * @param storedPassword the stored password
     * @return
     * @throws NoSuchAlgorithmException if the algorithm is not found
     * @throws InvalidKeySpecException if the key specification is invalid
     */
    public static boolean validatePassword(String originalPassword, String storedPassword)
            throws NoSuchAlgorithmException, InvalidKeySpecException {
        String[] parts = storedPassword.split(":");
        byte[] salt = Base64.getDecoder().decode(parts[0]);
        String hashOfInput = hashPassword(originalPassword, salt);
        return hashOfInput.equals(parts[1]);
    }

    public static void main(String[] args) {
        try {
            String password = "mySecurePassword";
//            String securePassword = "r5QC0oMVLLFMD1ifPrcu2w==:84NEcjDp1lxMRsq9bkJ4mPX1TUCUdXIRMpSTI2fIyDY=";
            // Example usage
            String securePassword = generateSecurePassword(password);
            System.out.println("Secure password: " + securePassword);

            // Validate the password
            boolean isValid = validatePassword(password, securePassword);
            System.out.println("Password is valid: " + isValid);

        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            e.printStackTrace();
        }
    }
}