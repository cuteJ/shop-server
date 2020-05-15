package com.onlythinking.shop.mgt.system.service;

import com.onlythinking.shop.model.OtSysUser;

import java.util.Map;
import java.util.Optional;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface SysUserLoginService {
    /**
     * <p>根据唯一标识查询登录用户信息</p>
     *
     * @param identify 唯一标识
     * @return OtSysUser
     */
    Optional<OtSysUser> findByIdentify(String identify);

    /**
     * <p>系统用户登录</p>
     *
     * @param username 账号
     * @param password 密码
     */
    void loginMgt(String username, String password);

    /**
     * <p>获取登录用户相关信息</p>
     */
    Map<String, Object> getSysUserInfo();

    /**
     * <p>修改密码</p>
     *
     * @param currentPassword  现密码
     * @param originalPassword 旧密码
     */
    void resetPassword(OtSysUser sysUser, String currentPassword, String originalPassword);

    OtSysUser updateUserDetail(OtSysUser aSysUser);
}
