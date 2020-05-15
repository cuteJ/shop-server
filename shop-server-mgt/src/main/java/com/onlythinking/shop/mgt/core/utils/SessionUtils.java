package com.onlythinking.shop.mgt.core.utils;

import com.onlythinking.commons.exception.GlobalErrorCode;
import com.onlythinking.commons.exception.RespondedException;
import com.onlythinking.shop.model.OtSysUser;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;

@Slf4j
public class SessionUtils {

    /**
     * 获取当前用户对象
     */
    public static OtSysUser getCurrentASysUser() {
        return getCurrentASysUser(true);
    }

    /**
     * 获取当前用户对象
     */
    public static OtSysUser getCurrentASysUser(boolean ifException) {
        Object principal = SecurityUtils.getSubject().getPrincipal();
        if (!(principal instanceof OtSysUser)) {
            if (ifException) {
                throw new RespondedException(GlobalErrorCode.SC_UNAUTHORIZED, "Unauthorized");
            }
            return null;
        }
        return (OtSysUser) principal;
    }

}
