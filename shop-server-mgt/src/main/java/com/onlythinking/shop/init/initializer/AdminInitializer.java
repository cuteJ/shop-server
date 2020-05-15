package com.onlythinking.shop.init.initializer;

import com.google.common.collect.ImmutableMap;
import com.onlythinking.shop.core.constant.DicConstant;
import com.onlythinking.shop.core.utils.EncryptionUtils;
import com.onlythinking.shop.core.utils.UUIDUtils;
import com.onlythinking.shop.mapper.OtSysRoleMapper;
import com.onlythinking.shop.mapper.OtSysRoleMenuRelMapper;
import com.onlythinking.shop.mapper.OtSysUserMapper;
import com.onlythinking.shop.mapper.OtSysUserRoleRelMapper;
import com.onlythinking.shop.model.OtSysRole;
import com.onlythinking.shop.model.OtSysRoleMenuRel;
import com.onlythinking.shop.model.OtSysUser;
import com.onlythinking.shop.model.OtSysUserRoleRel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor
public class AdminInitializer implements Initializer {

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

    private final OtSysUserMapper sysUserMapper;
    private final OtSysRoleMapper sysRoleMapper;
    private final OtSysUserRoleRelMapper sysUserRoleRelMapper;
    private final OtSysRoleMenuRelMapper sysRoleMenuRelMapper;

    private static final String ADMIN = "admin";
    private static final String PWD = "123123";

    @Override
    public void before() {
        log.info("开始初始化Admin....");

        List<OtSysUser> userViews = sysUserMapper.getList(ImmutableMap.of("username", ADMIN));
        if (CollectionUtils.isNotEmpty(userViews)) {
            for (OtSysUser user : userViews) {
                sysUserMapper.deleteByPK(user.getId());
                List<String> userRoleIds = sysUserRoleRelMapper.getList(ImmutableMap.of("userId", user.getId()))
                  .stream()
                  .map(OtSysUserRoleRel::getId).collect(Collectors.toList());
                if (CollectionUtils.isNotEmpty(userRoleIds)) {
                    sysUserRoleRelMapper.deleteInBatch(userRoleIds);
                }
            }
        }

        List<OtSysRole> sysRoles = sysRoleMapper.getList(ImmutableMap.of("roleCode", ADMIN));
        if (CollectionUtils.isNotEmpty(sysRoles)) {
            for (OtSysRole role : sysRoles) {
                sysRoleMapper.deleteByPK(role.getId());
                List<String> roleMenuIds = sysRoleMenuRelMapper.getList(ImmutableMap.of("roleId", role.getId()))
                  .stream()
                  .map(OtSysRoleMenuRel::getId).collect(Collectors.toList());

                if (CollectionUtils.isNotEmpty(roleMenuIds)) {
                    sysRoleMenuRelMapper.deleteInBatch(roleMenuIds);
                }
            }
        }

    }

    @Override
    @Transactional
    public void process() {
        String userId = UUIDUtils.getUUID();
        String roleId = ADMIN;

        OtSysRole role = new OtSysRole();
        role.setId(roleId);
        role.setRoleCode(ADMIN);
        role.setRoleName(ADMIN);
        role.setStatus(DicConstant.VAL_1000_00);

        sysRoleMapper.insert(role);

        OtSysUser user = new OtSysUser();
        user.setId(userId);
        user.setActive(true);
        user.setUsername(ADMIN);
        user.setRealName(ADMIN);
        user.setAvatar(RandomStringUtils.randomNumeric(10));
        user.setPassword(EncryptionUtils.md5(PWD));
        sysUserMapper.insert(user);

        log.info("初始化Menus结束");
    }


}
