package com.onlythinking.shop.mgt.user.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.page.PageEntity;
import com.onlythinking.shop.mgt.user.service.UserLoginMgtService;
import com.onlythinking.shop.model.OtUserMaSession;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

import static com.onlythinking.shop.mgt.core.constant.PermissionsConstant.USER_LOGIN_LIST;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "用户相关")
@ApiRest(serviceId = AppSystem.SERVER_USER)
public class UserMgtController {
    private final UserLoginMgtService userLoginMgtService;

    @ApiOperation("用户列表")
    @RequiresPermissions(value = USER_LOGIN_LIST)
    @PostMapping(value = "/login/list")
    public PageEntity<?> userLoginList(PageEntity<?> page) {
        page.startPage();
        page.setList(userLoginMgtService.getList(page.getParams()));
        return page;
    }

    @ApiOperation("小程序会话分页列表")
    @RequiresPermissions(value = USER_LOGIN_LIST)
    @PostMapping(value = "/ma_session/list")
    public PageEntity<?> maSessionList(PageEntity<?> page) {
        page.startPage();
        page.setList(userLoginMgtService.getMaSessionList(page.getParams()));
        return page;
    }

    @ApiOperation("小程序会话列表")
    @RequiresPermissions(value = USER_LOGIN_LIST)
    @PostMapping(value = "/ma_session/_list")
    public List<OtUserMaSession> maSessionList(@RequestParam Map<String, Object> params) {
        return userLoginMgtService.getMaSessionList(params);
    }
}
