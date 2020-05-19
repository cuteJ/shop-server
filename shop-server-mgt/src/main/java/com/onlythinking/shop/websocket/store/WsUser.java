package com.onlythinking.shop.websocket.store;

import lombok.Builder;
import lombok.Data;

import javax.websocket.Session;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
@Builder
public class WsUser {

    // sessionId
    private String id;

    private Session session;
    private String username;
    private String avatar;

}
