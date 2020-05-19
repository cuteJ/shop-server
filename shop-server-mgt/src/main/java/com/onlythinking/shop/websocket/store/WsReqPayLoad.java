package com.onlythinking.shop.websocket.store;

import lombok.Builder;
import lombok.Data;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
@Builder
public class WsReqPayLoad {
    protected String username;
    protected String avatar;
    protected String type;
    private String data;
}
