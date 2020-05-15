package com.onlythinking.shop.mgt.system.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.commons.exception.RespondedBody;
import com.onlythinking.shop.mgt.core.trace.TracingOpt;
import com.onlythinking.shop.mgt.system.dto.LoginDto;
import com.onlythinking.shop.mgt.system.service.SysUserLoginService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.validation.Valid;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "系统（管理）")
@ApiRest(serviceId = "login")
public class LoginMgtController {

    private final SysUserLoginService userLoginService;

    @TracingOpt("系统用户登录")
    @ApiOperation("系统用户登录")
    @PostMapping("/auth")
    public RespondedBody loginMgt(@Valid @RequestBody LoginDto dto) {
        userLoginService.loginMgt(dto.getUsername(), dto.getPassword());
        return RespondedBody.successful();
    }

    @TracingOpt("系统用户注销")
    @ApiOperation("用户注销")
    @PostMapping(value = "/logout")
    public RespondedBody logout() {
        SecurityUtils.getSubject().logout();
        return RespondedBody.successful();
    }
}
