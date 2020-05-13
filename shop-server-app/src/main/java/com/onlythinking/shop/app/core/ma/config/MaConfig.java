package com.onlythinking.shop.app.core.ma.config;

import java.util.concurrent.locks.Lock;

/**
 * 百度小程序配置
 *
 * @author Li Xingping
 */
public interface MaConfig {

    String getAccessToken();

    Lock getAccessTokenLock();

    boolean isAccessTokenExpired();

    /**
     * 强制将access token过期掉
     */
    void expireAccessToken();

    /**
     * 应该是线程安全的
     *
     * @param accessToken 要更新的MaAccessToken对象
     */
    void updateAccessToken(MaAccessToken accessToken);

    /**
     * 应该是线程安全的
     *
     * @param accessToken      新的accessToken值
     * @param expiresInSeconds 过期时间，以秒为单位
     */
    void updateAccessToken(String accessToken, int expiresInSeconds);

    String getAppid();

    String getSecret();

    /**
     * 是否自动刷新token
     */
    boolean autoRefreshToken();

}
