package com.onlythinking.shop.mgt.user.service.impl;

import com.onlythinking.shop.mapper.OtUserLoginMapper;
import com.onlythinking.shop.mapper.OtUserMaSessionMapper;
import com.onlythinking.shop.mgt.user.service.UserLoginMgtService;
import com.onlythinking.shop.model.OtUserLogin;
import com.onlythinking.shop.model.OtUserMaSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
public class UserLoginMgtServiceImpl implements UserLoginMgtService {

    private final OtUserLoginMapper userLoginMapper;
    private final OtUserMaSessionMapper userMaSessionMapper;

    @Override
    public List<OtUserMaSession> getMaSessionList(Map<String, Object> params) {
        return userMaSessionMapper.getList(params);
    }

    @Override
    public List<OtUserLogin> getList(Map<String, Object> params) {
        return userLoginMapper.getList(params);
    }
}
