package com.onlythinking.shop.mgt.brand.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.commons.exception.RespondedBody;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.page.PageEntity;
import com.onlythinking.shop.mgt.brand.dto.OtAppBrandViewDto;
import com.onlythinking.shop.mgt.brand.service.AppBrandMgtService;
import com.onlythinking.shop.model.OtAppMaConfig;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.onlythinking.shop.mgt.core.constant.PermissionsConstant.*;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "应用相关")
@ApiRest(serviceId = AppSystem.SERVER_APP_BRAND)
public class AppBrandMgtController {
    private final AppBrandMgtService appBrandMgtService;

    @ApiOperation("应用品牌列表")
    @RequiresPermissions(value = APP_BRAND_LIST)
    @PostMapping(value = "/brand/list")
    public PageEntity<?> appBrandList(PageEntity<?> page) {
        page.startPage();
        page.setList(appBrandMgtService.getList(page.getParams()));
        return page;
    }

    @ApiOperation("应用品牌详情")
    @RequiresPermissions(value = APP_BRAND_LIST)
    @GetMapping(value = "/brand/ma_config/{id}")
    public List<OtAppMaConfig> appBrandMaConfig(@PathVariable("id") String id) {
        return appBrandMgtService.getAppBrandMaConfig(id);
    }

    @ApiOperation("应用品牌详情")
    @RequiresPermissions(value = APP_BRAND_SAVE)
    @GetMapping(value = "/brand/details/{id}")
    public OtAppBrandViewDto appBrandDetails(@PathVariable("id") String id) {
        return appBrandMgtService.getAppBrandDetails(id);
    }

    @ApiOperation("应用品牌添加")
    @RequiresPermissions(value = APP_BRAND_SAVE)
    @PostMapping(value = "/brand/save")
    public RespondedBody appBrandSave(@RequestBody OtAppBrandViewDto dto) {
        appBrandMgtService.saveOrUpdateBrand(dto);
        return RespondedBody.successful();
    }

    @ApiOperation("应用品牌删除")
    @RequiresPermissions(value = APP_BRAND_REMOVE)
    @DeleteMapping(value = "/brand/remove/{id}")
    public RespondedBody appBrandRemove(@PathVariable("id") String id) {
        appBrandMgtService.removeAppBrand(id);
        return RespondedBody.successful();
    }

    @ApiOperation("应用小程序配置删除")
    @RequiresPermissions(value = APP_BRAND_REMOVE)
    @DeleteMapping(value = "/ma_config/remove/{id}")
    public RespondedBody appMaConfigRemove(@PathVariable("id") String id) {
        appBrandMgtService.removeAppMaConfig(id);
        return RespondedBody.successful();
    }

    @ApiOperation("小程序配置添加")
    @RequiresPermissions(value = APP_BRAND_SAVE)
    @PostMapping(value = "/ma_config/save")
    public RespondedBody maConfigSave(@RequestBody OtAppMaConfig dto) {
        appBrandMgtService.saveOrUpdateMaConfig(dto);
        return RespondedBody.successful();
    }
}
