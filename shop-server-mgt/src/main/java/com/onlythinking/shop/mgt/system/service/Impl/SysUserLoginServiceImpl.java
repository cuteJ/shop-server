package com.onlythinking.shop.mgt.system.service.Impl;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import com.onlythinking.commons.exception.RespondedException;
import com.onlythinking.commons.helper.PredicateHelper;
import com.onlythinking.shop.core.utils.EncryptionUtils;
import com.onlythinking.shop.mapper.OtSysUserMapper;
import com.onlythinking.shop.mgt.core.exception.MgtErrorCode;
import com.onlythinking.shop.mgt.core.service.ShiroRealmService;
import com.onlythinking.shop.mgt.core.utils.SessionUtils;
import com.onlythinking.shop.mgt.system.dto.RouterMenu;
import com.onlythinking.shop.mgt.system.model.SysUserInfo;
import com.onlythinking.shop.mgt.system.service.SysUserLoginService;
import com.onlythinking.shop.model.OtSysMenu;
import com.onlythinking.shop.model.OtSysUser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
public class SysUserLoginServiceImpl implements SysUserLoginService {

    private final OtSysUserMapper sysUserMapper;
    private final ShiroRealmService shiroRealmService;
//    private final ShiroUserSessionService shiroUserSessionService;

    @Override
    public Optional<OtSysUser> findByIdentify(String identify) {
        return Optional.ofNullable(
          sysUserMapper.getOne(ImmutableMap.of("username", identify))
        );
    }

    @Override
    public void loginMgt(String username, String password) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("username", username);
        OtSysUser oldUser = sysUserMapper.getOne(params);
        PredicateHelper.checkNotNull(oldUser, "{mgt.system.login.userIsNull}");

        if (!oldUser.getPassword().equals(EncryptionUtils.md5(password.trim()))) {
            throw new RespondedException(MgtErrorCode.BAD_CREDENTIALS, "{mgt.system.login.badCredentials}");
        }
        if (!Boolean.TRUE.equals(oldUser.getActive())) {
            throw new RespondedException(MgtErrorCode.USER_LOCKED, "{mgt.system.login.userLocked}");
        }
        // 注销之前登录会话
//        shiroUserSessionService.alreadyActive(username, true);

        sysUserMapper.updateByPK(oldUser);
        UsernamePasswordToken token = new UsernamePasswordToken(oldUser.getUsername(), oldUser.getPassword(), false);
        SecurityUtils.getSubject().login(token);
    }

    @Override
    public Map<String, Object> getSysUserInfo() {
        OtSysUser sysUser = SessionUtils.getCurrentASysUser();
        Map<String, Object> result = Maps.newHashMap();
        String username = sysUser.getUsername();
        Set<String> permissions = shiroRealmService.findPermissionsByUserName(username);
        List<OtSysMenu> sysMenus = shiroRealmService.findMenusByUserName(username);
        List<RouterMenu> routerMenus = RouterMenu.toRouterMenu(sysMenus);
        result.put("userPermission", new SysUserInfo(
          username,
          sysUser.getId(),
          sysUser.getAvatar(),
          shiroRealmService.findRolesByUserName(username),
          permissions,
          routerMenus
        ));
        return result;
    }

    @Override
    @Transactional
    public void resetPassword(OtSysUser aSysUser, String currentPassword, String originalPassword) {
        String oldPasswordMD5 = EncryptionUtils.md5(originalPassword);
        if (!aSysUser.getPassword().equals(oldPasswordMD5)) {
            throw new RespondedException(MgtErrorCode.NORMAL_API_EXCEPTION, "{mgt.system.resetPassword.badCredentials}");
        }
        String newPasswordMD5 = EncryptionUtils.md5(currentPassword);
        OtSysUser user = new OtSysUser();
        user.setId(aSysUser.getId());
        user.setPassword(newPasswordMD5);
        sysUserMapper.updateByPK(user);
    }

    @Override
    @Transactional
    public OtSysUser updateUserDetail(OtSysUser aSysUser) {
        sysUserMapper.updateByPK(aSysUser);
        return aSysUser;
    }
}
