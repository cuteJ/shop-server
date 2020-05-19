package com.onlythinking.shop.websocket.store;

import com.alibaba.fastjson.JSON;
import lombok.Builder;
import lombok.Data;

import java.util.Date;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
@Builder
public class WsChatResp {
    private String username;
    private String avatar;
    private String msg;
    private boolean self;
    private Date createdTime;

    public String toJson() {
        return JSON.toJSONString(this);
    }
}
