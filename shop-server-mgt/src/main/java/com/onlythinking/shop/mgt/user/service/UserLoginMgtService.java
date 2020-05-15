package com.onlythinking.shop.mgt.user.service;

import com.onlythinking.shop.model.OtUserLogin;
import com.onlythinking.shop.model.OtUserMaSession;

import java.util.List;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface UserLoginMgtService {
    List<OtUserMaSession> getMaSessionList(Map<String, Object> params);

    List<OtUserLogin> getList(Map<String, Object> params);
}
