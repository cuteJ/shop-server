package com.onlythinking.shop.websocket.handler;

import com.onlythinking.shop.websocket.store.WsReqPayLoad;
import com.onlythinking.shop.websocket.store.WsRespPayLoad;

import javax.websocket.Session;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface WsHandler {

    WsRespPayLoad onMessage(Session session, WsReqPayLoad payLoad);

}
