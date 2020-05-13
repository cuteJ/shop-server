package com.onlythinking.shop.app.core.ma.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.onlythinking.shop.app.core.ma.config.MaConfig;
import com.onlythinking.shop.app.core.ma.config.SwanMaConfig;

/**
 * <p> The describe </p>
 * todo 后期开发
 *
 * @author Li Xingping
 */
public class DefaultSwanMaService implements SwanMaService {

    private final ObjectMapper objectMapper;
    private final SwanMaConfig wxMaConfig;

    public DefaultSwanMaService(ObjectMapper objectMapper, SwanMaConfig wxMaConfig) {
        this.objectMapper = objectMapper;
        this.wxMaConfig = wxMaConfig;
    }

    @Override
    public SwanMaJscode2SessionResult jsCode2SessionInfo(String jsCode) {
        return null;
    }

    @Override
    public SwanMaUserInfo getUserInfo(String sessionKey, String encryptedData, String ivStr) {
        return null;
    }

    @Override
    public String getPhoneNoInfo(String sessionKey, String encryptedData, String ivStr) {
        return null;
    }

    @Override
    public String getAccessToken() {
        return null;
    }

    @Override
    public MaConfig getMaConfig() {
        return null;
    }

    @Override
    public boolean checkUserInfo(String sessionKey, String rawData, String signature) {
        return false;
    }

    @Override
    public void getUnionid() {

    }
}
