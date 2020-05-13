package com.onlythinking.shop.core.helper;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public class PasswordMd5PasswordEncoder implements PasswordEncoder {

    @Override
    public String encode(CharSequence rawPassword) {
        return DigestUtils.md5Hex(String.valueOf(rawPassword));
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        return DigestUtils.md5Hex(String.valueOf(rawPassword)).equals(encodedPassword);
    }
}
