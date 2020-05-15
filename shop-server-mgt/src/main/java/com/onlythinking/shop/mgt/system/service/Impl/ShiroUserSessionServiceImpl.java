package com.onlythinking.shop.mgt.system.service.Impl;

import com.onlythinking.shop.mgt.system.model.OnlineSysUser;
import com.onlythinking.shop.mgt.system.service.ShiroUserSessionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
public class ShiroUserSessionServiceImpl implements ShiroUserSessionService {

    private final SessionDAO sessionDAO;

    @Override
    public int onlineSysUserTotal() {
        return sessionDAO.getActiveSessions().size();
    }

    @Override
    public List<OnlineSysUser> sysUsersOnline() {
        List<OnlineSysUser> usersOnline = new ArrayList<>();
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        for (Session session : sessions) {
            OnlineSysUser userOnline = new OnlineSysUser();
            // Todo session 持久化能获取用户信息
            userOnline.setId((String) session.getId());
            userOnline.setHost(session.getHost());
            userOnline.setStartTimestamp(session.getStartTimestamp());
            userOnline.setLastAccessTime(session.getLastAccessTime());
            Long timeout = session.getTimeout();
            userOnline.setTimeout(timeout);
            usersOnline.add(userOnline);
        }
        return usersOnline;
    }

    @Override
    public boolean forceLogout(String sessionId) {
        Session session = sessionDAO.readSession(sessionId);
        session.setTimeout(0);
        sessionDAO.delete(session);
        return true;
    }

    @Override
    public boolean alreadyActive(String username, boolean forceLogout) {
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        boolean already = false;
//        for (Session session : sessions) {
//
//            Object currentUser = session.getAttribute(SessionUtils.CURRENT_USER);
//
//            if (!(currentUser instanceof OtSysUser)) {
//                continue;
//            }
//            String pk = ((OtSysUser) currentUser).getUsername();
//            if (StringUtils.isNotBlank(pk) && pk.equals(username)) {
//                already = true;
//                if (forceLogout) {
//                    session.setTimeout(0);
//                    sessionDAO.delete(session);
//                }
//            }
//        }
        return already;
    }
}
