package com.onlythinking.shop.core.constant;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class AppSystem {

    // spring profiles
    public static final String SPRING_PROFILE_DOC = "apiDocs"; // 文档环境
    public static final String SPRING_PROFILE_DEV = "dev"; // 开发环境环境

    // 系统用户
    public static final String OPERATOR_SYS = "system"; // 系统

    // server name
    public static final String SERVER_SYS = "sys"; // 系统相关
    public static final String SERVER_APP_BRAND = "app_brand"; // 应用相关
    public static final String SERVER_USER = "user"; // 应用相关
    public static final String SERVER_MA = "ma"; // 小程序相关

    // 客户端接口前缀
    public static final String SERVER_APP = "app"; // 客户端接口
    public static final String SERVER_INSECURE = "insecure"; // 不安全接口

    // 角色
    public static final String ROLE_USER = "ROLE_USER";
    public static final String ROLE_ADMIN = "ROLE_ADMIN";

    // 分隔符
    public static final String SEPARATOR_COMMA = ",";
    public static final String SEPARATOR_TIME = ":";
    public static final String SEPARATOR_MENU = "#";

    // log
    public final static String ERROR_LOG_PREFIX = "TRACK_ERROR ";

}
