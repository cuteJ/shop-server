package com.onlythinking.shop.mgt.system.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Getter
@AllArgsConstructor
public enum IntervalUnit {
    MILLISECOND("毫秒"),
    SECOND("秒"),
    MINUTE("分"),
    HOUR("时"),
    DAY("天"),
    WEEK("周"),
    MONTH("月"),
    YEAR("年");

    private String text;
}
