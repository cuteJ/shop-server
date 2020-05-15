package com.onlythinking.shop.mgt.core.security.session;

import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListenerAdapter;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
public class SessionListenerLogger extends SessionListenerAdapter {

    @Override
    public void onStart(Session session) {
        log.info("Saw start of Session: [{}]", session.toString());
    }

    @Override
    public void onStop(Session session) {
        log.info("Saw stop of Session: [{}]", session.toString());
    }

    @Override
    public void onExpiration(Session session) {
        log.info("Saw expiration of Session: [{}]", session.toString());
    }
}
