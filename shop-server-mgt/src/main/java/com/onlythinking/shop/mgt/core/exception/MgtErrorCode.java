package com.onlythinking.shop.mgt.core.exception;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

/**
 * <p> API 响应 CODE 对照表 </p>
 *
 * @author Li Xingping
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public final class MgtErrorCode {

    //-----------------------------------------Mgt业务服务|错误码(41000-42000)---------------------------------------------------
    public static final int BAD_CREDENTIALS = 41000,// 实体不存在,详见 Message 提示内容。
      USER_LOCKED = 41001,            // 用户被锁定 详见 Message 提示内容。
      NORMAL_API_EXCEPTION = 41002;   // 常规业务异常返回
}
