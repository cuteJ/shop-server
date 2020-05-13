package com.onlythinking.shop.core.utils.crypt;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.Arrays;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public class AESUtils {

    /**
     * The constant that denotes the algorithm being used.
     */
    private static final String algorithm = "AES";

    /**
     * The private constructor to prevent instantiation of this object.
     */
    private AESUtils() {

    }

    /**
     * The method that will generate a random {@link SecretKey}.
     *
     * @return The key generated.
     */
    public static SecretKey generateKey() {
        try {
            KeyGenerator keyGenerator = KeyGenerator.getInstance(algorithm);
            keyGenerator.init(128);
            return keyGenerator.generateKey();
        } catch (Exception ex) {

        }
        return null;
    }

    /**
     * Creates a new {@link SecretKey} based on a password.
     *
     * @param password The password that will be the {@link SecretKey}.
     * @return The key.
     */
    public static SecretKey createKey(String password) {
        try {
            byte[] key = password.getBytes("UTF-8");
            MessageDigest sha = MessageDigest.getInstance("SHA-1");
            key = sha.digest(key);
            key = Arrays.copyOf(key, 16); // use only first 128 bit

            return new SecretKeySpec(key, algorithm);
        } catch (Exception ex) {

        }

        return null;
    }

    /**
     * Creates a new {@link SecretKey} based on a password with a specified salt.
     *
     * @param salt     The random salt.
     * @param password The password that will be the {@link SecretKey}.
     * @return The key.
     */
    public static SecretKey createKey(byte[] salt, String password) {
        try {
            byte[] key = (Arrays.toString(salt) + password).getBytes("UTF-8");
            MessageDigest sha = MessageDigest.getInstance("SHA-1");
            key = sha.digest(key);
            key = Arrays.copyOf(key, 16); // use only first 128 bit

            return new SecretKeySpec(key, algorithm);
        } catch (Exception ex) {

        }

        return null;
    }

    /**
     * The method that writes the {@link SecretKey} to a file.
     *
     * @param key  The key to write.
     * @param file The file to create.
     * @throws IOException If the file could not be created.
     */
    public static void writeKey(SecretKey key, File file) throws IOException {
        try (FileOutputStream fis = new FileOutputStream(file)) {
            fis.write(key.getEncoded());
        }
    }

    /**
     * Gets a {@link SecretKey} from a {@link File}.
     *
     * @param file The file that is encoded as a key.
     * @return The key.
     * @throws IOException The exception thrown if the file could not be read as a {@link SecretKey}.
     */
    public static SecretKey getSecretKey(File file) throws IOException {
        return new SecretKeySpec(Files.readAllBytes(file.toPath()), algorithm);
    }

    /**
     * The method that will encrypt data.
     *
     * @param secretKey The key used to encrypt the data.
     * @param data      The data to encrypt.
     * @return The encrypted data.
     */
    public static byte[] encrypt(SecretKey secretKey, byte[] data) {
        try {
            Cipher cipher = Cipher.getInstance(algorithm);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            return cipher.doFinal(data);
        } catch (Exception ex) {

        }

        return null;

    }

    /**
     * The method that will decrypt a piece of encrypted data.
     *
     * @param password  The password used to decrypt the data.
     * @param encrypted The encrypted data.
     * @return The decrypted data.
     */
    public static byte[] decrypt(String password, byte[] encrypted) {
        try {
            Cipher cipher = Cipher.getInstance(algorithm);
            cipher.init(Cipher.DECRYPT_MODE, AESUtils.createKey(password));
            return cipher.doFinal(encrypted);
        } catch (Exception ex) {

        }
        return null;
    }

    /**
     * The method that will decrypt a piece of encrypted data.
     *
     * @param secretKey The key used to decrypt encrypted data.
     * @param encrypted The encrypted data.
     * @return The decrypted data.
     */
    public static byte[] decrypt(SecretKey secretKey, byte[] encrypted) {
        try {
            Cipher cipher = Cipher.getInstance(algorithm);
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            return cipher.doFinal(encrypted);
        } catch (Exception ex) {

        }
        return null;
    }

}
