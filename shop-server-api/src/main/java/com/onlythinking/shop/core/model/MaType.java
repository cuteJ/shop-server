package com.onlythinking.shop.core.model;

import lombok.Getter;

/**
 * <p> 小程序类型 </p>
 *
 * @author Li Xingping
 */
@Getter
public enum MaType {
    wx,//"微信"
    swan,//"百度"
    my,//"支付宝"
    tt,//"头条"
    h5,
    web
}
