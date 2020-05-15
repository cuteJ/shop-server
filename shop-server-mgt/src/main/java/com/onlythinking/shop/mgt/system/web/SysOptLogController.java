package com.onlythinking.shop.mgt.system.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.page.PageEntity;
import com.onlythinking.shop.mapper.OtSysOptLogMapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;

import static com.onlythinking.shop.mgt.core.constant.PermissionsConstant.SYS_USER_OPTLOG;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "系统操作日志")
@ApiRest(serviceId = AppSystem.SERVER_SYS)
public class SysOptLogController {

    private final OtSysOptLogMapper sysOptLogMapper;

    @ApiOperation("操作日志")
    @RequiresPermissions(value = SYS_USER_OPTLOG)
    @PostMapping(value = "/opt_log/list")
    public PageEntity<?> optLogList(PageEntity<?> page) {
        page.startPage();
        page.setList(sysOptLogMapper.getList(page.getParams()));
        return page;
    }

}
