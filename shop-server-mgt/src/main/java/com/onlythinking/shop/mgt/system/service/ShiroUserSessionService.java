package com.onlythinking.shop.mgt.system.service;

import com.onlythinking.shop.mgt.system.model.OnlineSysUser;

import java.util.List;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface ShiroUserSessionService {

    /**
     * <p>在线会话数</p>
     */
    int onlineSysUserTotal();

    /**
     * <p>当前在线用户</p>
     */
    List<OnlineSysUser> sysUsersOnline();

    /**
     * <p>强制注销在线用户</p>
     */
    boolean forceLogout(String sessionId);

    /**
     * 查询该账户是否已激活
     *
     * @param username    登录账户
     * @param forceLogout 如果存在是否注销之前用户
     * @return bool
     */
    boolean alreadyActive(String username, boolean forceLogout);

}
