package com.onlythinking.shop.app.user.web;

import com.google.common.collect.Lists;
import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.shop.app.core.utils.SecurityUtils;
import com.onlythinking.shop.app.user.service.UserLoginService;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.model.OtUserLogin;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "系统（管理）")
@ApiRest(serviceId = AppSystem.SERVER_APP)
public class UserInfoController {

    private final UserLoginService userLoginService;

    @ApiOperation("获取登录用户信息")
    @GetMapping("/user_info")
    public OtUserLogin userInfo() {
        String uid = SecurityUtils.getCurrentUserId();
        return userLoginService.get(uid);
    }

    @GetMapping("/msg_list")
    public List<String> msgList() {
        String uid = SecurityUtils.getCurrentUserId();

        return Lists.newArrayList("Hello", "world");
    }

}
