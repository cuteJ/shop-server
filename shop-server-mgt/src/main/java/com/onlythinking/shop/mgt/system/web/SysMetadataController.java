package com.onlythinking.shop.mgt.system.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.commons.exception.RespondedBody;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.page.PageEntity;
import com.onlythinking.shop.mgt.core.mysql.TableMetadataDto;
import com.onlythinking.shop.mgt.system.service.SysMetadataService;
import com.onlythinking.shop.model.OtTableMetadata;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

import static com.onlythinking.shop.mgt.core.constant.PermissionsConstant.*;

/**
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "数据字典")
@ApiRest(serviceId = AppSystem.SERVER_SYS, value = "/metadata")
public class SysMetadataController {
    private final SysMetadataService sysMetadataService;

    @ApiOperation("列表")
    @RequiresPermissions(value = SYS_DB_LIST)
    @PostMapping(value = "/table/all_list")
    public List<OtTableMetadata> allTableList(@RequestParam Map<String, Object> params) {
        return sysMetadataService.getList(params);
    }

    @ApiOperation("列表")
    @PostMapping(value = "/table/list")
    @RequiresPermissions(value = SYS_DB_LIST)
    public PageEntity<?> tableList(PageEntity<?> page) {
        page.startPage();
        page.setList(sysMetadataService.getList(page.getParams()));
        return page;
    }

    @RequiresPermissions(value = SYS_DB_SYNC)
    @ApiOperation(value = "同步表结构")
    @PostMapping("/sync")
    public RespondedBody sync() {
        sysMetadataService.sync();
        return RespondedBody.successful();
    }

    @RequiresPermissions(value = SYS_DB_LIST)
    @ApiOperation(value = "表结构")
    @GetMapping("/details/{id}")
    public TableMetadataDto details(@PathVariable String id) {
        return sysMetadataService.getDetail(id);
    }
}
