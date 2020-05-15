package com.onlythinking.shop.mgt.system.model;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.util.Date;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@ApiModel("系统在线用户")
@Data
public class OnlineSysUser {

    private static final long serialVersionUID = 1L;
    // session id
    private String id;
    // 用户id
    private String userId;
    // 用户名称
    private String username;
    // 用户主机地址
    private String host;
    // 用户登录时系统IP
    private String systemHost;
    // 会话状态
    private String status;
    // session创建时间
    private Date startTimestamp;
    // session最后访问时间
    private Date lastAccessTime;
    // 超时时间
    private Long timeout;
}
