package com.onlythinking.shop.core.utils.crypt;

import javax.crypto.Cipher;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public class RSAUtils {
    /**
     * The constant that denotes the algorithm being used.
     */
    private static final String algorithm = "RSA";

    /**
     * The private constructor to prevent instantiation of this object.
     */
    private RSAUtils() {

    }

    /**
     * The method that will create both the public and private key used to encrypt and decrypt the data.
     *
     * @param publicKeyOutput  The path of where the public key will be created.
     * @param privateKeyOutput The path of where the private key will be created.
     * @return {@code true} If this operation was successful, otherwise {@code false}.
     */
    public static boolean generateKey(String publicKeyOutput, String privateKeyOutput) {
        try {
            final KeyPairGenerator keyGen = KeyPairGenerator.getInstance(algorithm);
            keyGen.initialize(2048);

            final KeyPair key = keyGen.generateKeyPair();

            try (DataOutputStream dos = new DataOutputStream(new FileOutputStream(new File(publicKeyOutput)))) {
                dos.write(key.getPublic().getEncoded());
            }

            try (DataOutputStream dos = new DataOutputStream(new FileOutputStream(new File(privateKeyOutput)))) {
                dos.write(key.getPrivate().getEncoded());
            }

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * The method that will encrypt an array of bytes.
     *
     * @param key  The public key used to encrypt the data.
     * @param data The data in the form of bytes.
     * @return The encrypted bytes, otherwise {@code null} if encryption could not be performed.
     */
    public static byte[] encrypt(PublicKey key, byte[] data) {
        try {

            final Cipher cipher = Cipher.getInstance(algorithm);

            cipher.init(Cipher.ENCRYPT_MODE, key);

            return cipher.doFinal(data);

        } catch (Exception ex) {

        }

        return null;

    }

    /**
     * The method that will decrypt an array of bytes.
     *
     * @param key           The {@link PrivateKey} used to decrypt the data.
     * @param encryptedData The encrypted byte array.
     * @return The decrypted data, otherwise {@code null} if decryption could not be performed.
     */
    public static byte[] decrypt(PrivateKey key, byte[] encryptedData) {

        try {

            final Cipher cipher = Cipher.getInstance(algorithm);

            cipher.init(Cipher.DECRYPT_MODE, key);

            return cipher.doFinal(encryptedData);

        } catch (Exception ex) {

        }

        return null;

    }

    /**
     * The method that will re-create a {@link PublicKey} from a serialized key.
     *
     * @param publicKeyPath The path of the public key file.
     * @return The {@link PublicKey} object.
     * @throws Exception If there was an issue reading the file.
     */
    public static PublicKey getPublicKey(String publicKeyPath) throws Exception {
        return KeyFactory.getInstance(algorithm).generatePublic(new X509EncodedKeySpec(Files.readAllBytes(Paths.get(publicKeyPath))));
    }

    /**
     * The method that will re-create a {@link PrivateKey} from a serialized key.
     *
     * @param privateKeyPath The path of the private key file.
     * @return The {@link PrivateKey} object.
     * @throws Exception If there was an issue reading the file.
     */
    public static PrivateKey getPrivateKey(String privateKeyPath) throws Exception {
        return KeyFactory.getInstance(algorithm).generatePrivate(new PKCS8EncodedKeySpec(Files.readAllBytes(Paths.get(privateKeyPath))));
    }

    /**
     * The method that will re-create a {@link PublicKey} from a public key byte array.
     *
     * @param encryptedPublicKey The byte array of a public key.
     * @return The {@link PublicKey} object.
     * @throws Exception If there was an issue reading the byte array.
     */
    public static PublicKey getPublicKey(byte[] encryptedPublicKey) throws Exception {
        return KeyFactory.getInstance(algorithm).generatePublic(new X509EncodedKeySpec(encryptedPublicKey));
    }

    /**
     * The method that will re-create a {@link PrivateKey} from a private key byte array.
     *
     * @param encryptedPrivateKey The array of bytes of a private key.
     * @return The {@link PrivateKey} object.
     * @throws Exception If there was an issue reading the byte array.
     */
    public static PrivateKey getPrivateKey(byte[] encryptedPrivateKey) throws Exception {
        return KeyFactory.getInstance(algorithm).generatePrivate(new PKCS8EncodedKeySpec(encryptedPrivateKey));
    }
}
