package com.onlythinking.shop.app.core.ma.service;

import com.onlythinking.shop.app.core.ma.config.MaConfig;

/**
 * @author Li Xingping
 */
public interface MaService {


    /**
     * 获取access_token, 不强制刷新access_token.
     */
    String getAccessToken();

    /**
     * 获取MaConfig 对象.
     *
     * @return MaConfig
     */
    MaConfig getMaConfig();

    /**
     * 验证用户信息完整性.
     *
     * @param sessionKey 会话密钥
     * @param rawData    微信用户基本信息
     * @param signature  数据签名
     * @return .
     */
    boolean checkUserInfo(String sessionKey, String rawData, String signature);


    /***
     * 小程序用户 + 开发者主体维度 唯一的id
     */
    void getUnionid();
}
