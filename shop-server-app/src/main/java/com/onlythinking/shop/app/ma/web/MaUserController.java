package com.onlythinking.shop.app.ma.web;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import cn.binarywang.wx.miniapp.bean.WxMaUserInfo;
import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.commons.exception.RespondedBody;
import com.onlythinking.commons.exception.RespondedException;
import com.onlythinking.shop.app.core.ma.config.MaConfiguration;
import com.onlythinking.shop.app.core.security.JwtUser;
import com.onlythinking.shop.app.core.security.UserUniqueKey;
import com.onlythinking.shop.app.core.utils.SecurityUtils;
import com.onlythinking.shop.app.ma.dto.PhoneInfoDto;
import com.onlythinking.shop.app.ma.dto.UserInfoDto;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * 微信小程序用户接口
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "微信小程序")
@ApiRest(serviceId = AppSystem.SERVER_APP, value = "/ma/{appNo}/{maType}")
public class MaUserController {

    private final UserLoginService userLoginService;

    /**
     * 保存登录用户信息
     */
    @ApiOperation("保存登录用户信息")
    @PostMapping("/user")
    public RespondedBody userInfo(@ApiParam(value = "应用编号", required = true)
                                  @PathVariable String appNo,
                                  @PathVariable MaType maType,
                                  @RequestBody UserInfoDto dto) {
        JwtUser currentUser = SecurityUtils.getCurrentUser();

        OtUserMaSession maSession = userLoginService.findMaSessionByUid(currentUser.getId());
        if (null == maSession) {
            UserUniqueKey userUniqueKey = UserUniqueKey.splitUniqueKey(currentUser.getUsername());
            maSession = userLoginService.findMaSessionByOpenid(appNo, maType, userUniqueKey.getUniqueKey());
        }

        if (MaType.wx.equals(maType)) {
            final WxMaService wxService = MaConfiguration.getWxMaService(appNo);
            // 用户信息校验
            if (!wxService.getUserService().checkUserInfo(maSession.getSessionKey(), dto.getRawData(), dto.getSignature())) {
                throw RespondedException.argumentInvalid("user check failed");
            }
            // 解密用户信息
            WxMaUserInfo userInfo = wxService.getUserService().getUserInfo(maSession.getSessionKey(), dto.getEncryptedData(), dto.getIv());

            OtUserLogin userLoginDto = new OtUserLogin();
            userLoginDto.setAppNo(appNo);
            userLoginDto.setMaType(maType.name());
            userLoginDto.setOpenid(maSession.getOpenid());
            userLoginDto.setNickName(userInfo.getNickName());
            // todo 头像拷贝
            userLoginDto.setAvatarUrl(userInfo.getAvatarUrl());
            userLoginDto.setGender(Integer.parseInt(userInfo.getGender()));
            userLoginDto.setCountry(userInfo.getCountry());
            userLoginDto.setProvince(userInfo.getProvince());

            userLoginService.saveOrUpdate(userLoginDto);
        }
        // todo 添加其它小程序用户保存
        return RespondedBody.successful();
    }

    /**
     * 获取用户绑定手机号
     */
    @ApiOperation("获取用户绑定手机号")
    @GetMapping("/phone")
    public RespondedBody phone(@ApiParam(value = "应用编号", required = true)
                               @PathVariable String appNo,
                               @PathVariable MaType maType,
                               @RequestBody PhoneInfoDto dto) {
        JwtUser currentUser = SecurityUtils.getCurrentUser();

        OtUserMaSession maSession = userLoginService.findMaSessionByUid(currentUser.getId());
        if (null == maSession) {
            UserUniqueKey userUniqueKey = UserUniqueKey.splitUniqueKey(currentUser.getUsername());
            maSession = userLoginService.findMaSessionByOpenid(appNo, maType, userUniqueKey.getUniqueKey());
        }

        if (MaType.wx.equals(maType)) {
            final WxMaService wxService = MaConfiguration.getWxMaService(appNo);

            // 用户信息校验
            if (!wxService.getUserService().checkUserInfo(maSession.getSessionKey(), dto.getRawData(), dto.getSignature())) {
                throw RespondedException.argumentInvalid("user check failed");
            }
            // 解密
            WxMaPhoneNumberInfo phoneNoInfo = wxService.getUserService().getPhoneNoInfo(maSession.getSessionKey(), dto.getEncryptedData(), dto.getIv());

            OtUserLogin userLoginDto = new OtUserLogin();
            userLoginDto.setAppNo(appNo);
            userLoginDto.setMaType(maType.name());
            userLoginDto.setOpenid(maSession.getOpenid());
            userLoginDto.setPhoneNo(phoneNoInfo.getPhoneNumber());

            userLoginService.saveOrUpdate(userLoginDto);
        }
        return RespondedBody.successful();
    }

}
