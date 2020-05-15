package com.onlythinking.shop.mgt.core.security;

import com.onlythinking.shop.mgt.core.service.ShiroRealmService;
import com.onlythinking.shop.model.OtSysUser;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.util.CollectionUtils;

import java.util.Set;

@Slf4j
public class ShiroRealm extends AuthorizingRealm {

    private final ShiroRealmService shiroRealmService;

    public ShiroRealm(ShiroRealmService shiroRealmService) {
        this.shiroRealmService = shiroRealmService;
    }

    /**
     * 认证回调函数 登录时调用
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        return new SimpleAuthenticationInfo(shiroRealmService.findUserByUsername(token.getUsername()), token.getCredentials(), getName());
    }

    /**
     * 权限授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        log.debug("=========================================================================");
        log.debug("AuthorizingRealm doGetAuthorizationInfo start");
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        OtSysUser principal = (OtSysUser) principals.fromRealm(getName()).iterator().next();

        //角色roles授权
        Set<String> roles = shiroRealmService.findRolesByUserName(principal.getUsername());
        if (!CollectionUtils.isEmpty(roles)) {
            authorizationInfo.setRoles(roles);
        }

        //许可perms授权
        Set<String> perms = shiroRealmService.findPermissionsByUserName(principal.getUsername());
        perms.addAll(roles);
        if (!CollectionUtils.isEmpty(roles)) {
            authorizationInfo.addStringPermissions(perms);
        }

        authorizationInfo.setRoles(roles);
        authorizationInfo.addStringPermissions(perms);

        log.debug("登录用户：{}", principal);
        log.debug("roles: {}", roles);
        log.debug("perms: {}", perms);

        log.debug("AuthorizingRealm doGetAuthorizationInfo end");
        log.debug("=========================================================================");
        return authorizationInfo;
    }

}

