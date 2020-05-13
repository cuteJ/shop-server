package com.onlythinking.shop.app.user.service;

import com.onlythinking.shop.core.model.MaType;
import com.onlythinking.shop.core.service.OtBasicService;
import com.onlythinking.shop.mapper.OtUserLoginMapper;
import com.onlythinking.shop.model.OtUserLogin;
import com.onlythinking.shop.model.OtUserLoginLog;
import com.onlythinking.shop.model.OtUserMaSession;

import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface UserLoginService extends OtBasicService<OtUserLogin, OtUserLoginMapper> {

    /**
     * 查询登录用户信息
     *
     * @param appNo     应用编号
     * @param maType    类型
     * @param uniqueKey 唯一值 openid phoneNo username
     * @return OtUserLogin
     */
    OtUserLogin findByUniqueKey(String appNo, MaType maType, String uniqueKey);

    Long countBy(Map<String, Object> params);

    /**
     * 小程序会话密钥
     *
     * @param appNo  应用编号
     * @param maType 类型
     * @param openid 小程序openid
     * @return OtUserMaSession
     */
    OtUserMaSession findMaSessionByOpenid(String appNo, MaType maType, String openid);

    OtUserMaSession findMaSessionByUid(String uid);

    OtUserMaSession findMaSessionBy(Map<String, Object> params);

    void saveOrUpdateMaSession(OtUserMaSession dto);

    void saveOrUpdate(OtUserLogin dto);

    /**
     * 保存登录日志
     *
     * @param dto 登录日志
     */
    void saveUserLoginLog(OtUserLoginLog dto);
}
