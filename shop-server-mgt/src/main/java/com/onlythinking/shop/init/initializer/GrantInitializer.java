package com.onlythinking.shop.init.initializer;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import com.onlythinking.shop.mapper.OtSysAuthorityMapper;
import com.onlythinking.shop.mapper.OtSysMenuMapper;
import com.onlythinking.shop.mapper.OtSysRoleMapper;
import com.onlythinking.shop.mapper.OtSysUserMapper;
import com.onlythinking.shop.mgt.system.service.InfraSystemService;
import com.onlythinking.shop.model.OtSysAuthority;
import com.onlythinking.shop.model.OtSysMenu;
import com.onlythinking.shop.model.OtSysRole;
import com.onlythinking.shop.model.OtSysUser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor
public class GrantInitializer implements Initializer {

    private Initializer next;

    @Override
    public Initializer getNext() {
        return next;
    }

    @Override
    public Initializer buildNext(Initializer next) {
        this.next = next;
        return this.next;
    }

    private final InfraSystemService infraSystemService;
    private final OtSysRoleMapper sysRoleMapper;
    private final OtSysUserMapper sysUserMapper;
    private final OtSysAuthorityMapper sysAuthorityMapper;
    private final OtSysMenuMapper sysMenuMapper;

    private static final String ADMIN = "admin";

    @Override
    public void before() {
        log.info("开始初始化Grant....");
    }

    @Override
    public void process() {
        OtSysRole dbRoles = sysRoleMapper.getOne(ImmutableMap.of("roleCode", ADMIN));
        List<OtSysMenu> sysMenus = sysMenuMapper.getList(new HashMap<>());
        List<OtSysAuthority> sysAuthorities = sysAuthorityMapper.getList(new HashMap<>());
        // 角色授权所有权限和菜单
        infraSystemService.batchGrantRolePermissions(Lists.newArrayList(dbRoles.getId()), sysAuthorities.stream().map(OtSysAuthority::getId).collect(Collectors.toList()));
        infraSystemService.batchGrantRoleMenus(Lists.newArrayList(dbRoles.getId()), sysMenus.stream().map(OtSysMenu::getId).collect(Collectors.toList()), null);

        OtSysUser db = sysUserMapper.getOne(ImmutableMap.of("username", ADMIN));
        infraSystemService.batchGrantUserRoles(Lists.newArrayList(db.getId()), Lists.newArrayList(dbRoles.getId()));

        log.info("初始化Grant结束");
    }

}
