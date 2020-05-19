package com.onlythinking.shop.websocket;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import com.onlythinking.shop.websocket.handler.ChatWsHandler;
import com.onlythinking.shop.websocket.handler.KfWsHandler;
import com.onlythinking.shop.websocket.handler.WsHandler;
import com.onlythinking.shop.websocket.store.WsReqPayLoad;
import com.onlythinking.shop.websocket.store.WsRespPayLoad;
import com.onlythinking.shop.websocket.store.WsStore;
import com.onlythinking.shop.websocket.store.WsUser;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@Component
@ServerEndpoint("/ws")
public class WebsocketServerEndpoint {

    private static Map<String, WsHandler> wsHandler = Maps.newConcurrentMap();

    static {
        wsHandler.put("robot", new KfWsHandler());
        wsHandler.put("chat", new ChatWsHandler());
    }

    @OnOpen
    public void onOpen(Session session) {
        log.info("New ws connection {} ", session.getId());
        WsStore.put(session.getId(), WsUser.builder().id(session.getId()).session(session).build());
        respMsg(session, WsRespPayLoad.ok().toJson());
    }

    @OnClose
    public void onClose(Session session, CloseReason closeReason) {
        WsStore.remove(session.getId());
        log.warn("ws closed，reason:{}", closeReason);
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        log.info("accept client messages: {}" + message);
        WsReqPayLoad payLoad = JSON.parseObject(message, WsReqPayLoad.class);
        if (StringUtils.isBlank(payLoad.getType())) {
            respMsg(session, WsRespPayLoad.ofError("Type is null.").toJson());
            return;
        }
        WsUser wsUser = WsStore.get(session.getId());
        if (null == wsUser || StringUtils.isBlank(wsUser.getUsername())) {
            WsStore.put(session.getId(), WsUser.builder()
              .id(session.getId())
              .username(payLoad.getUsername())
              .avatar(payLoad.getAvatar())
              .session(session)
              .build()
            );
        }
        WsHandler handler = wsHandler.get(payLoad.getType());
        if (null != handler) {
            WsRespPayLoad resp = handler.onMessage(session, payLoad);
            if (null != resp) {
                respMsg(session, resp.toJson());
            }
        } else {
            respMsg(session, WsRespPayLoad.ok().toJson());
        }
    }

    @OnError
    public void onError(Session session, Throwable e) {
        WsStore.remove(session.getId());
        log.error("WS Error: ", e);
    }

    private void respMsg(Session session, String content) {
        try {
            session.getBasicRemote().sendText(content);
        } catch (IOException e) {
            log.error("Ws resp msg error {} {}", content, e);
        }
    }
}
