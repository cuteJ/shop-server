package com.onlythinking.shop.core.exception;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

/**
 * <p> API 响应 CODE 对照表 </p>
 *
 * @author Li Xingping
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public final class CoreErrorCode {

    //-----------------------------------------系统服务|错误码(10000-20000)---------------------------------------------------
    public static final int THIRD_HTTP_CLIENT_ERROR = 10000, // 外联服务失败，详见 Message 提示内容。
      THIRD_HTTP_CLIENT_IO_ERROR = 10001,
      THIRD_SMS_CLIENT_ERROR = 10002,
      THIRD_SMS_CLIENT_IO_ERROR = 10003,// 外联服务通讯异常，请联系开发人员。
      ENTITY_NULL = 10004,// 实体不存在,详见 Message 提示内容。
      EXPECT_ONLY_ONE = 10005,// 预期只返回一条数据，但是返回多条
      INVALID_REQUEST = 10006,// 无效
      SCHEDULE_JOB_EXCEPTION = 10007;// 定时任务异常

    //-----------------------------------------业务服务|错误码(40000-50000)---------------------------------------------------
    public static final int TOKEN_EXPIRED = 40000;                     // Token 过期。
}
