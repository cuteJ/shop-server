package com.onlythinking.shop.mgt.core.service;

import com.onlythinking.shop.model.OtSysMenu;
import com.onlythinking.shop.model.OtSysUser;

import java.util.List;
import java.util.Set;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface ShiroRealmService {

    OtSysUser findUserByUsername(String username);

    /**
     * 根据用户名查询菜单
     *
     * @param username 用户名
     * @return 菜单列表
     */
    List<OtSysMenu> findMenusByUserName(String username);

    /**
     * 根据用户名查询角色
     *
     * @param username 用户名
     * @return 角色列表
     */
    Set<String> findRolesByUserName(String username);

    /**
     * 根据用户名查询权限
     *
     * @param username 用户名
     * @return 权限列表
     */
    Set<String> findPermissionsByUserName(String username);
}
