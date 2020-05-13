package com.onlythinking.shop.core.utils;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.apache.commons.codec.digest.DigestUtils;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class EncryptionUtils {

    public static String md5(String str) {
        return DigestUtils.md5Hex(str);
    }
}
