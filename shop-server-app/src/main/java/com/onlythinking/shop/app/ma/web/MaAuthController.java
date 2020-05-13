package com.onlythinking.shop.app.ma.web;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.commons.exception.RespondedException;
import com.onlythinking.shop.app.core.ma.config.MaConfiguration;
import com.onlythinking.shop.app.core.ma.service.SwanMaJscode2SessionResult;
import com.onlythinking.shop.app.core.ma.service.SwanMaService;
import com.onlythinking.shop.app.core.security.JwtTokenUtil;
import com.onlythinking.shop.app.core.security.UserUniqueKey;
import com.onlythinking.shop.app.ma.dto.MaLoginDto;
import com.onlythinking.shop.app.user.dto.LoginResp;
import com.onlythinking.shop.app.user.service.UserLoginService;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.model.MaType;
import com.onlythinking.shop.model.OtUserLogin;
import com.onlythinking.shop.model.OtUserMaSession;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户登录接口
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "用户登录")
@ApiRest(serviceId = AppSystem.SERVER_APP, value = "/auth/{appNo}/{maType}")
public class MaAuthController {

    private final JwtTokenUtil jwtTokenUtil;
    private final UserLoginService userLoginService;
    private final PasswordEncoder passwordEncoder;

    /**
     * 登陆接口
     */
    @ApiOperation("登陆接口")
    @PostMapping("/ma_login")
    public LoginResp maLogin(@ApiParam(value = "应用编号", required = true)
                             @PathVariable String appNo,
                             @PathVariable MaType maType,
                             @RequestBody MaLoginDto dto,
                             HttpServletRequest request) {
        if (!MaType.h5.equals(maType)) {
            if (StringUtils.isBlank(dto.getCode())) {
                throw RespondedException.argumentInvalid("Empty jsCode.");
            }
        }
        LoginResp resp = new LoginResp();

        if (MaType.wx.equals(maType)) {
            final WxMaService wxService = MaConfiguration.getWxMaService(appNo);
            try {
                WxMaJscode2SessionResult session = wxService.getUserService().getSessionInfo(dto.getCode());
                if (StringUtils.isBlank(session.getOpenid())) {
                    throw RespondedException.argumentInvalid("Wx session is null.");
                }
                String openid = session.getOpenid();
                OtUserMaSession maSession = new OtUserMaSession();
                maSession.setAppNo(appNo);
                maSession.setMaType(maType.name());
                maSession.setOpenid(openid);

                maSession.setSessionKey(session.getSessionKey());

                OtUserLogin dbUser = userLoginService.findByUniqueKey(appNo, maType, openid);
                if (null != dbUser) {
                    maSession.setUid(dbUser.getId());
                }
                userLoginService.saveOrUpdateMaSession(maSession);

                String token = jwtTokenUtil.generateToken(UserUniqueKey.uniqueKey(appNo, maType.name(), openid));
                resp.setHasUser(null != dbUser);

                resp.setToken(token);
            } catch (WxErrorException e) {
                log.error(e.getMessage(), e);
                throw RespondedException.argumentInvalid(e.getError().getErrorMsg());
            }
        } else if (MaType.swan.equals(maType)) {
            final SwanMaService swanMaService = MaConfiguration.getSwanMaService(appNo);
            SwanMaJscode2SessionResult session = swanMaService.jsCode2SessionInfo(dto.getCode());
            String openid = session.getOpenid();
            OtUserMaSession maSession = new OtUserMaSession();
            maSession.setAppNo(appNo);
            maSession.setMaType(maType.name());
            maSession.setOpenid(openid);
            maSession.setSessionKey(session.getSessionKey());

            OtUserLogin dbUser = userLoginService.findByUniqueKey(appNo, maType, openid);
            if (null != dbUser) {
                maSession.setUid(dbUser.getId());
            }
            userLoginService.saveOrUpdateMaSession(maSession);

            String token = jwtTokenUtil.generateToken(UserUniqueKey.uniqueKey(appNo, maType.name(), openid));
            resp.setHasUser(null != dbUser);
            resp.setToken(token);
        } else {
            throw RespondedException.argumentInvalid("{http.error.400}");
        }
        return resp;
    }

    @ApiOperation("账号登陆")
    @PostMapping("/login")
    public LoginResp login(@ApiParam(value = "应用编号", required = true)
                           @PathVariable String appNo,
                           @PathVariable MaType maType,
                           @RequestBody MaLoginDto dto,
                           HttpServletRequest request) {
        LoginResp resp = new LoginResp();
        if (MaType.h5.equals(maType)) {
            OtUserLogin userLogin = userLoginService.findByUniqueKey(appNo, maType, dto.getUsername());
            if (null == userLogin) {
                throw RespondedException.argumentInvalid("{mgt.system.login.badCredentials}");
            }
            // todo 校验短信验证码
            String token = jwtTokenUtil.generateToken(UserUniqueKey.uniqueKey(appNo, maType.name(), userLogin.getPhoneNo()));
            resp.setHasUser(true);
            resp.setToken(token);
            return resp;
        }
        OtUserLogin userLogin = userLoginService.getOne("username", dto.getUsername());
        if (null == userLogin) {
            throw RespondedException.argumentInvalid("{mgt.system.login.badCredentials}");
        }
        if (!passwordEncoder.matches(dto.getPassword(), userLogin.getPassword())) {
            throw RespondedException.argumentInvalid("{mgt.system.login.badCredentials}");
        }
        String token = jwtTokenUtil.generateToken(userLogin.getUsername());
        resp.setHasUser(true);
        resp.setToken(token);
        return resp;
    }

}
