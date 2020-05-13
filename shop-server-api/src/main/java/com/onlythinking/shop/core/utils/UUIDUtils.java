package com.onlythinking.shop.core.utils;

import com.eaio.uuid.UUID;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class UUIDUtils {

    public static String getUUID() {
        return new UUID().toString().replace("-", "");
    }
}
