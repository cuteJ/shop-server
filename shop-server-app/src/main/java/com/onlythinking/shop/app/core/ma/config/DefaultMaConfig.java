package com.onlythinking.shop.app.core.ma.config;

import lombok.Getter;
import lombok.Setter;

import java.util.concurrent.locks.Lock;

/**
 * 百度小程序配置
 *
 * @author Li Xingping
 */
@Setter
@Getter
public class DefaultMaConfig implements SwanMaConfig {
    private Lock accessTokenLock;

    protected volatile String appid;
    private volatile String secret;
    private volatile String accessToken;
    private volatile long expiresTime;

    protected long expiresAheadInMillis(int expiresInSeconds) {
        return System.currentTimeMillis() + (expiresInSeconds - 200) * 1000L;
    }

    /**
     * 判断 expiresTime 是否已经过期
     */
    protected boolean isExpired(long expiresTime) {
        return System.currentTimeMillis() > expiresTime;
    }

    @Override
    public String getAccessToken() {
        return this.accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    @Override
    public Lock getAccessTokenLock() {
        return this.accessTokenLock;
    }

    public void setAccessTokenLock(Lock accessTokenLock) {
        this.accessTokenLock = accessTokenLock;
    }

    @Override
    public boolean isAccessTokenExpired() {
        return isExpired(this.expiresTime);
    }

    @Override
    public void expireAccessToken() {
        this.expiresTime = 0;
    }

    @Override
    public synchronized void updateAccessToken(MaAccessToken accessToken) {
        updateAccessToken(accessToken.getAccessToken(), accessToken.getExpiresIn());
    }

    @Override
    public synchronized void updateAccessToken(String accessToken, int expiresInSeconds) {
        setAccessToken(accessToken);
        setExpiresTime(expiresAheadInMillis(expiresInSeconds));
    }

    @Override
    public boolean autoRefreshToken() {
        return true;
    }
}
