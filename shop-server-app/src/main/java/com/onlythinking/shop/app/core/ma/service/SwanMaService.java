package com.onlythinking.shop.app.core.ma.service;

/**
 * <p> 百度小程序API </p>
 *
 * @author Li Xingping
 */
public interface SwanMaService extends MaService {

    /**
     * 获取access_token.
     */
    String GET_ACCESS_TOKEN_URL = "https://openapi.baidu.com/oauth/2.0/token?grant_type=client_credentials&client_id=%s&client_secret=%s&scope=smartapp_snsapi_base";

    String JSCODE_TO_SESSION_URL = "https://spapi.baidu.com/oauth/jscode2sessionkey";
    String GET_UNIQUEID = "https://openapi.baidu.com/rest/2.0/smartapp/getunionid?access_token=%s";

    /**
     * 获取登录后的session信息.
     *
     * @param jsCode 登录时获取的 code
     */
    SwanMaJscode2SessionResult jsCode2SessionInfo(String jsCode) ;

    /**
     * 解密用户敏感数据.
     *
     * @param sessionKey    会话密钥
     * @param encryptedData 消息密文
     * @param ivStr         加密算法的初始向量
     */
    SwanMaUserInfo getUserInfo(String sessionKey, String encryptedData, String ivStr);

    /**
     * 解密用户手机号信息.
     *
     * {
     *     "detail": {
     *         "encryptedData": "ZOrJtrJ4eWkDOciQmyXPfqJhcF4t+SJsLYuIWufKt+/aBsXjKH/3iv7GafIE5DqqfEQjor4=",
     *         "errMsg": "getPhoneNumber:ok",
     *         "iv": "ce93b68c8ae71460706f8w=="
     *     }
     * }
     *
     * @param sessionKey    会话密钥
     * @param encryptedData 消息密文
     * @param ivStr         加密算法的初始向量
     * @return .
     */
    String getPhoneNoInfo(String sessionKey, String encryptedData, String ivStr);

}
