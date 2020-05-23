package com.onlythinking.shop.mgt.system.dto;

import lombok.Data;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
public class IpLog {

    private String ip;

    private String country;// 国家

    private String province; // 省
    private String city; // 市
    private String county; // 县区

    private String name;
    private long value;
}
