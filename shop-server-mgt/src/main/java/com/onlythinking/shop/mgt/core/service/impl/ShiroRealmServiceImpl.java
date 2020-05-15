package com.onlythinking.shop.mgt.core.service.impl;

import com.google.common.collect.ImmutableMap;
import com.onlythinking.shop.mapper.OtSysUserMapper;
import com.onlythinking.shop.mgt.core.mapper.ShiroRelamMapper;
import com.onlythinking.shop.mgt.core.service.ShiroRealmService;
import com.onlythinking.shop.model.OtSysMenu;
import com.onlythinking.shop.model.OtSysUser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
public class ShiroRealmServiceImpl implements ShiroRealmService {

    private final ShiroRelamMapper shiroRelamMapper;
    private final OtSysUserMapper sysUserMapper;

    @Override
    public OtSysUser findUserByUsername(String username) {
        return sysUserMapper.getOne(ImmutableMap.of("username", username));
    }

    @Override
    public List<OtSysMenu> findMenusByUserName(String username) {
        Map<String, Object> params = new HashMap<>();
        params.put("username", username);
        return shiroRelamMapper.findMenus(params);
    }

    @Override
    public Set<String> findRolesByUserName(String username) {
        Map<String, Object> params = new HashMap<>();
        params.put("username", username);
        return new HashSet<>(shiroRelamMapper.findRoleCodes(params));
    }

    @Override
    public Set<String> findPermissionsByUserName(String username) {
        Map<String, Object> params = new HashMap<>();
        params.put("username", username);
        List<String> permissionsByRole = shiroRelamMapper.findPermissionsByRole(params);
        List<String> permissionsByMenu = shiroRelamMapper.findPermissionsByMenu(params);
        permissionsByMenu.addAll(permissionsByRole);
        return new HashSet<>(permissionsByMenu);
    }
}
