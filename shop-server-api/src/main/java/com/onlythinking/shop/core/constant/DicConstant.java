package com.onlythinking.shop.core.constant;

import com.google.common.collect.Sets;

import java.util.Set;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface DicConstant {

    // 是否
    String TYPE_1000 = "1000";
    String VAL_1000_00 = "100000"; // 是
    String VAL_1000_01 = "100001"; // 否

    // 性别
    String TYPE_1001 = "1001";
    String VAL_1001_00 = "100100"; // 未知
    String VAL_1001_01 = "100101"; // 男
    String VAL_1001_02 = "100102"; // 女

    // 任务触发器类型
    String TYPE_1002 = "1002";
    String VAL_1002_00 = "100200"; // 固定频率 SimpleTrigger|CalendarIntervalTrigger
    String VAL_1002_01 = "100201"; // 每日时间段 DailyTimeIntervalTrigger
    String VAL_1002_02 = "100202"; // CRON  CronTrigger

    // 任务实例状态
    String TYPE_1003 = "1003";
    String VAL_1003_00 = "100300"; // 运行中
    String VAL_1003_01 = "100301"; // 暂停
    String VAL_1003_02 = "100302"; // 失败

    // 任务运行状态
    String TYPE_1004 = "1004";
    String VAL_1004_00 = "100400"; // 成功
    String VAL_1004_01 = "100401"; // 失败

    String TYPE_1005 = "1005"; // 用户登录模式
    String VAL_1005_00 = "100500"; // 微信
    String VAL_1005_01 = "100501"; // 用户名

    Set<String> CALENDAR_INTERVAL = Sets.newHashSet(
      "DAY",
      "WEEK",
      "MONTH",
      "YEAR"
    );

    Set<String> ALL_INTERVAL = Sets.newHashSet(
      "MILLISECOND",
      "SECOND",
      "MINUTE",
      "HOUR",
      "DAY",
      "WEEK",
      "MONTH",
      "YEAR"
    );

}
