package com.onlythinking.shop.app.user.service.impl;

import com.google.common.collect.ImmutableMap;
import com.onlythinking.shop.app.user.service.UserLoginService;
import com.onlythinking.shop.core.model.MaType;
import com.onlythinking.shop.mapper.OtUserLoginLogMapper;
import com.onlythinking.shop.mapper.OtUserLoginMapper;
import com.onlythinking.shop.mapper.OtUserMaSessionMapper;
import com.onlythinking.shop.model.OtUserLogin;
import com.onlythinking.shop.model.OtUserLoginLog;
import com.onlythinking.shop.model.OtUserMaSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
public class UserLoginServiceImpl implements UserLoginService {
    private final OtUserLoginMapper userLoginMapper;
    private final OtUserLoginLogMapper userLoginLogMapper;
    private final OtUserMaSessionMapper userMaSessionMapper;

    @Override
    public OtUserLoginMapper getMapper() {
        return userLoginMapper;
    }

    @Override
    public OtUserLogin findByUniqueKey(String appNo, MaType maType, String uniqueKey) {
        if (StringUtils.isBlank(appNo) || null == maType) {
            return userLoginMapper.getOne(ImmutableMap.of("username", uniqueKey));
        }
        if (MaType.h5.equals(maType)) {
            return userLoginMapper.getOne(ImmutableMap.of("appNo", appNo, "maType", maType.name(), "phoneNo", uniqueKey));
        }
        return userLoginMapper.getOne(ImmutableMap.of("appNo", appNo, "maType", maType.name(), "openid", uniqueKey));
    }

    @Override
    public Long countBy(Map<String, Object> params) {
        return userLoginMapper.count(params);
    }

    @Override
    public OtUserMaSession findMaSessionByOpenid(String appNo, MaType maType, String openid) {
        return userMaSessionMapper.getOne(ImmutableMap.of("appNo", appNo, "maType", maType.name(), "openid", openid));
    }

    @Override
    public OtUserMaSession findMaSessionByUid(String uid) {
        if (StringUtils.isBlank(uid)) {
            return null;
        }
        return userMaSessionMapper.getOne(ImmutableMap.of("uid", uid));
    }

    @Override
    public OtUserMaSession findMaSessionBy(Map<String, Object> params) {
        return userMaSessionMapper.getOne(params);
    }

    @Override
    @Transactional
    public void saveOrUpdateMaSession(OtUserMaSession dto) {
        OtUserMaSession db = userMaSessionMapper.getOne(ImmutableMap.of("appNo", dto.getAppNo(), "maType", dto.getMaType(), "openid", dto.getOpenid()));
        if (null != db) {
            db.setAppNo(dto.getAppNo());
            db.setMaType(dto.getMaType());
            db.setOpenid(dto.getOpenid());
            db.setSessionKey(dto.getSessionKey());
            db.setUid(dto.getUid());
            userMaSessionMapper.updateByPK(db);
        } else {
            userMaSessionMapper.insert(dto);
        }
    }

    @Override
    @Transactional
    public void saveOrUpdate(OtUserLogin dto) {
        OtUserLogin db = this.findByUniqueKey(dto.getAppNo(), MaType.valueOf(dto.getMaType()), dto.getOpenid());
        if (null != db) {
            dto.setId(db.getId());
            userLoginMapper.updateByPK(dto);
        } else {
            userLoginMapper.insert(dto);
        }
    }

    @Override
    public void saveUserLoginLog(OtUserLoginLog dto) {
        userLoginLogMapper.insert(dto);
    }
}
