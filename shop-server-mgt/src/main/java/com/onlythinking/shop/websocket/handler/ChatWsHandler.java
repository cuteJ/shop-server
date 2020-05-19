package com.onlythinking.shop.websocket.handler;

import com.onlythinking.shop.websocket.store.*;
import lombok.extern.slf4j.Slf4j;

import javax.websocket.Session;
import java.util.Date;
import java.util.List;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
public class ChatWsHandler implements WsHandler {

    @Override
    public WsRespPayLoad onMessage(Session session, WsReqPayLoad payLoad) {
        // 广播消息
        List<WsUser> allSessions = WsStore.getAll();
        for (WsUser s : allSessions) {
            WsRespPayLoad resp = WsRespPayLoad.builder()
              .data(
                WsChatResp.builder()
                  .username(payLoad.getUsername())
                  .avatar(payLoad.getAvatar())
                  .msg(payLoad.getData())
                  .createdTime(new Date())
                  .self(s.getId().equals(session.getId()))
                  .build()
              )
              .build();
            log.info("Broadcast message {} {} ", s.getId(), s.getUsername());
            s.getSession().getAsyncRemote().sendText(resp.toJson());
        }
        return null;
    }

}
