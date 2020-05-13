package com.onlythinking.shop.app.brand.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.shop.app.brand.dto.AppMaConfigDto;
import com.onlythinking.shop.app.brand.service.AppBrandService;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.model.MaType;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@Api(tags = "应用配置")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@ApiRest(serviceId = AppSystem.SERVER_APP, value = AppSystem.SERVER_INSECURE)
public class AppBrandController {

    private final AppBrandService brandService;

    @ApiOperation("获取小程序配置")
    @GetMapping("/ma_config/{appNo}/{maType}")
    public AppMaConfigDto maConfig(@PathVariable String appNo, @PathVariable MaType maType) {
        return brandService.getByAppNoAndMaType(appNo, maType);
    }
}
