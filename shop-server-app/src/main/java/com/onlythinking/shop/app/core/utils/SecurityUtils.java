package com.onlythinking.shop.app.core.utils;

import com.onlythinking.commons.exception.RespondedException;
import com.onlythinking.shop.app.core.exception.AppErrorCode;
import com.onlythinking.shop.app.core.security.JwtUser;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class SecurityUtils {

    public static boolean isLogin() {
        return SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof JwtUser;
    }

    public static JwtUser getCurrentUser() {
        return getCurrentUser(false);
    }

    /**
     * <p>获取当前登录用户</p>
     */
    public static JwtUser getCurrentUser(boolean ifEmptyException) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (null == authentication) {
            throw new AuthenticationServiceException("UnAuthenticated");
        }

        if (authentication.getPrincipal() instanceof JwtUser) {
            JwtUser userAccount = (JwtUser) authentication.getPrincipal();
            if (ifEmptyException && StringUtils.isBlank(userAccount.getId())) {
                throw RespondedException.of(AppErrorCode.USER_UNREG, "User info is empty.");
            }
            return userAccount;
        }

        throw new AuthenticationServiceException("UnAuthenticated");
    }

    public static String getCurrentUserId() {
        JwtUser userAccount = getCurrentUser(true);
        return userAccount.getId();
    }
}
