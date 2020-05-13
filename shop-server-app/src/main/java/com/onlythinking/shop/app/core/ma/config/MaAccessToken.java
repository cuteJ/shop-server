package com.onlythinking.shop.app.core.ma.config;

import lombok.Data;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
public class MaAccessToken {
    private String accessToken;
    private String refreshToken;
    private int expiresIn = -1;
}
