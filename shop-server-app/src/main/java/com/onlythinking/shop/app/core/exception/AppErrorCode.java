package com.onlythinking.shop.app.core.exception;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

/**
 * <p> API 响应 CODE 对照表 </p>
 *
 * @author Li Xingping
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public final class AppErrorCode {

    //-----------------------------------------系统服务|错误码(10000-20000)---------------------------------------------------
    //-----------------------------------------业务服务|错误码(40000-50000)---------------------------------------------------

    public static final int USER_UNREG = 40001;                     // 用户未注册



}
