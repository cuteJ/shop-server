package com.onlythinking.shop.mgt.core.constant;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface PermissionsConstant {
    /**
     * 前端菜单目录
     */
    // 系统管理
    String SYSTEM_MANAGER = "systemManager";
    String SYS_USER_MANAGER = "sysUserManager";
    String SYS_ROLE_MANAGER = "sysRoleManager";
    String SYS_MENU_MANAGER = "sysMenuManager";
    String SYS_API_LIST_MANAGER = "sysApiListManager";
    String SYS_AUTHORITY_MANAGER = "sysAuthorityManager";
    String SYS_DIC_MANAGER = "sysDicManager";
    String SYS_JOB_MANAGER = "sysJobManager";
    String SYS_REGION_MANAGER = "sysRegionManager";
    String SYS_METADATA_MANAGER = "sysMetadataManager";
    String SYS_OPTLOG_MANAGER = "sysOptLogManager";


    // 应用管理
    String APP_MANAGER = "appManager";
    String APP_BRAND_MANAGER = "appBrandManager";

    //用户管理
    String USER_MANAGER = "userManager";
    String USER_LOGIN_MANAGER = "userLoginManager";

    // 统计管理
    String STATISTICS_MANAGER = "statisticsManager";
    String STATISTICS_CHART_MANAGER = "chartManager";

    /**
     * Module: sys
     * Action: list save update remove lock grant export import
     * 规则 (module:domain:action)
     */

    //-----------------------系统管理------------------------
    String SYS = "sys";

    String SYS_USER = "sys:user";
    String SYS_USER_LIST = "sys:user:list";
    String SYS_USER_SAVE = "sys:user:save";
    String SYS_USER_REMOVE = "sys:user:remove";
    String SYS_USER_LOCK = "sys:user:lock";
    String SYS_USER_GRANT = "sys:user:grant";
    String SYS_USER_OPTLOG = "sys:user:optLog";

    String SYS_ROLE = "sys:role";
    String SYS_ROLE_LIST = "sys:role:list";
    String SYS_ROLE_SAVE = "sys:role:save";
    String SYS_ROLE_REMOVE = "sys:role:remove";
    String SYS_ROLE_GRANT = "sys:role:grant";

    String SYS_MENU = "sys:menu";
    String SYS_MENU_LIST = "sys:menu:list";
    String SYS_MENU_SAVE = "sys:menu:save";
    String SYS_MENU_REMOVE = "sys:menu:remove";
    String SYS_MENU_GRANT = "sys:menu:grant";

    String SYS_AUTHORITY = "sys:authority";
    String SYS_AUTHORITY_LIST = "sys:authority:list";
    String SYS_AUTHORITY_SAVE = "sys:authority:save";
    String SYS_AUTHORITY_REMOVE = "sys:authority:remove";

    String SYS_APILIST = "sys:apiList";
    String SYS_APILIST_LIST = "sys:apiList:list";
    String SYS_APILIST_SAVE = "sys:apiList:save";
    String SYS_APILIST_REMOVE = "sys:apiList:remove";

    String SYS_QUARTZJOB = "sys:quartz_job";
    String SYS_QUARTZJOB_LIST = "sys:quartz_job:list";
    String SYS_QUARTZJOB_SAVE = "sys:quartz_job:save";
    String SYS_QUARTZJOB_REMOVE = "sys:quartz_job:remove";
    String SYS_QUARTZJOB_OPT = "sys:quartz_job:opt";

    String SYS_DB = "sys:db";
    String SYS_DB_LIST = "sys:db:list";
    String SYS_DB_SYNC = "sys:db:sync";

    //-----------------------应用管理------------------------
    String APP = "app";
    String APP_BRAND = "app:brand";
    String APP_BRAND_LIST = "app:brand:list";
    String APP_BRAND_SAVE = "app:brand:save";
    String APP_BRAND_REMOVE = "app:brand:remove";


    //-----------------------用户管理------------------------
    String USER = "user";
    String USER_LOGIN = "user:login";
    String USER_LOGIN_LIST = "user:login:list";

}
