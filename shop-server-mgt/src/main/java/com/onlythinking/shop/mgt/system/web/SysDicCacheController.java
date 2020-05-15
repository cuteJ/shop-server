package com.onlythinking.shop.mgt.system.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.commons.exception.RespondedBody;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.model.PrimitiveResponse;
import com.onlythinking.shop.core.page.PageEntity;
import com.onlythinking.shop.mgt.system.service.SysDicService;
import com.onlythinking.shop.model.OtSysDic;
import com.onlythinking.shop.model.OtSysTypeDic;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "系统（管理）")
@ApiRest(serviceId = AppSystem.SERVER_SYS, value = "code")
public class SysDicCacheController {

    private final SysDicService sysDicService;

    @ApiOperation("码值")
    @GetMapping(value = "/cache")
    public Map<String, Object> cache(@RequestParam("typeCode") String typeCode) {
        return sysDicService.getDictionaries(typeCode);
    }

    @ApiOperation("码值2")
    @PostMapping(value = "/caches")
    public Map<String, Object> caches(@RequestParam("typeCodes") String typeCodes) {
        return sysDicService.getDictionaries(Arrays.asList(StringUtils.split(typeCodes, AppSystem.SEPARATOR_COMMA)));
    }

    @ApiOperation("码类列表")
    @PostMapping(value = "/type/list")
    public PageEntity<?> sysTypeDicList(PageEntity<?> page) {
        page.startPage();
        page.setList(sysDicService.getSysTypeDicList(page.getParams()));
        return page;
    }

    @ApiOperation("码类添加")
    @PostMapping(value = "/type/save")
    public RespondedBody sysTypeDicSave(@RequestBody OtSysTypeDic dto) {
        sysDicService.saveOrUpdateSysTypeDic(dto);
        return RespondedBody.successful();
    }

    @ApiOperation("码类移除")
    @DeleteMapping(value = "/type/remove/{id}")
    public RespondedBody sysTypeDicRemove(@PathVariable("id") String id) {
        sysDicService.removeSysTypeDic(id);
        return RespondedBody.successful();
    }

    @ApiOperation("码值列表")
    @PostMapping(value = "/list")
    public PageEntity<?> sysDicList(PageEntity<?> page) {
        page.startPage();
        page.setList(sysDicService.getSysDicList(page.getParams()));
        return page;
    }

    @ApiOperation("码值添加")
    @PostMapping(value = "/save")
    public RespondedBody sysDicSave(@RequestBody OtSysDic dto) {
        sysDicService.saveOrUpdateSysDic(dto);
        return RespondedBody.successful();
    }

    @ApiOperation("码值移除")
    @DeleteMapping(value = "/remove/{id}")
    public RespondedBody sysDicRemove(@PathVariable("id") String id) {
        sysDicService.removeSysDic(id);
        return RespondedBody.successful();
    }

    @ApiOperation("获取类型下一个序列值")
    @GetMapping(value = "/type/last_code")
    public PrimitiveResponse getLastTypeDicCode() {
        return PrimitiveResponse.of(sysDicService.getLastTypeDicCode());
    }

    @ApiOperation("获取下一个序列值")
    @GetMapping(value = "/{typeCode}/last_code")
    public PrimitiveResponse getLastDicCode(@PathVariable("typeCode") String typeCode) {
        return PrimitiveResponse.of(sysDicService.getLastDicCode(typeCode));
    }

}
