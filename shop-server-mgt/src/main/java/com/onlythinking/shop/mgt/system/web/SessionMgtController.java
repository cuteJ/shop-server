package com.onlythinking.shop.mgt.system.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.commons.exception.RespondedBody;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.mgt.system.model.OnlineSysUser;
import com.onlythinking.shop.mgt.system.service.ShiroUserSessionService;
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
@Api(tags = "会话管理")
@ApiRest(serviceId = AppSystem.SERVER_SYS)
public class SessionMgtController {

    private final ShiroUserSessionService shiroUserSessionService;

    @ApiOperation("在线会话数")
    @GetMapping("/online_total")
    public int onlineTotal() {
        return shiroUserSessionService.onlineSysUserTotal();
    }

    @ApiOperation("在线用户")
    @GetMapping("/users_online")
    public List<OnlineSysUser> usersOnline() {
        return shiroUserSessionService.sysUsersOnline();
    }

    @ApiOperation("注销用户")
    @GetMapping("/force_logout")
    public RespondedBody forceLogout(String id) {
        shiroUserSessionService.forceLogout(id);
        return RespondedBody.successful();
    }

}
