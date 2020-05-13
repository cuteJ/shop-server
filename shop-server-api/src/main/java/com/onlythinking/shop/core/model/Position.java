package com.onlythinking.shop.core.model;

import lombok.Data;

import java.math.BigDecimal;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
public class Position {
    //经度
    private BigDecimal lng;
    //纬度
    private BigDecimal lat;
}
