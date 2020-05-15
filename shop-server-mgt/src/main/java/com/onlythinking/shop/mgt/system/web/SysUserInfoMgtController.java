package com.onlythinking.shop.mgt.system.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.commons.exception.RespondedBody;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.mgt.system.dto.ResetPasswordDto;
import com.onlythinking.shop.mgt.system.service.SysUserLoginService;
import com.onlythinking.shop.mgt.core.utils.SessionUtils;
import com.onlythinking.shop.model.OtSysUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.validation.Valid;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "系统（管理）")
@ApiRest(serviceId = AppSystem.SERVER_SYS)
public class SysUserInfoMgtController {

    private final SysUserLoginService userLoginService;

    @ApiOperation("获取用户登录信息")
    @GetMapping("/user_info")
    public Map<String, Object> getSysUserInfo() {
        return userLoginService.getSysUserInfo();
    }

    @ApiOperation("用户重置密码")
    @PostMapping("/reset_password")
    public RespondedBody resetPassword(@Valid @RequestBody ResetPasswordDto dto) {
        userLoginService.resetPassword(SessionUtils.getCurrentASysUser(), dto.getCurrentPassword(), dto.getOriginalPassword());
        return RespondedBody.successful();
    }

    @ApiOperation("获取用户信息")
    @GetMapping("/user_detail")
    public OtSysUser sysUserDetail() {
        return userLoginService.findByIdentify(SessionUtils.getCurrentASysUser().getUsername())
          .orElse(null);
    }

    @ApiOperation("更新用户信息")
    @PostMapping("/update/user_detail")
    public RespondedBody updateUserDetail(@RequestBody OtSysUser dto) throws InvocationTargetException, IllegalAccessException {
        OtSysUser aSysUser = SessionUtils.getCurrentASysUser();
        BeanUtils.copyProperties(aSysUser, dto);
        userLoginService.updateUserDetail(aSysUser);
        return RespondedBody.successful();
    }

}
