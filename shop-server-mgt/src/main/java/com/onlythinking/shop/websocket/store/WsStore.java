package com.onlythinking.shop.websocket.store;

import com.google.common.collect.Maps;
import lombok.Getter;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Getter
public class WsStore {

    //当前在线 Ws Session
    private final static Map<String, WsUser> ACTIVE_SESSION = Maps.newConcurrentMap();

    public static void put(String id, WsUser wsUser) {
        ACTIVE_SESSION.put(id, wsUser);
    }

    public static WsUser get(String id) {
        return ACTIVE_SESSION.get(id);
    }

    public static void remove(String id) {
        ACTIVE_SESSION.remove(id);
    }

    public static List<WsUser> getAll() {
        return new ArrayList<>(ACTIVE_SESSION.values());
    }


}
