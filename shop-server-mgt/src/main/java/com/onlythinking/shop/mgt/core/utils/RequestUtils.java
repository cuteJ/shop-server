package com.onlythinking.shop.mgt.core.utils;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public class RequestUtils {
    public static boolean isAjax(ServletRequest request) {
        String requestHeader = ((HttpServletRequest) request).getHeader("X-Requested-With");
        return "XMLHttpRequest".equals(requestHeader);
    }
}
