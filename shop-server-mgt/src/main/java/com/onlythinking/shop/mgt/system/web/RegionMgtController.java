package com.onlythinking.shop.mgt.system.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.commons.exception.RespondedBody;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.model.SelectTree;
import com.onlythinking.shop.core.page.PageEntity;
import com.onlythinking.shop.mgt.system.service.RegionService;
import com.onlythinking.shop.model.OtRegion;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "地区数据")
@ApiRest(serviceId = AppSystem.SERVER_SYS, value = "region")
public class RegionMgtController {

    private final RegionService regionService;

    @ApiOperation("初始化数据")
    @PostMapping(value = "/init/{depth}")
    public RespondedBody initRegion(@PathVariable("depth") int depth,
                                    @RequestBody Map<String, String> data) {
        regionService.initRegion(data, depth);
        return RespondedBody.successful();
    }

    @ApiOperation("地区数据")
    @GetMapping(value = "/child/{parentId}")
    public List<SelectTree> regionByPid(@PathVariable("parentId") String parentId) {
        return regionService.getByPid(parentId);
    }

    @ApiOperation("地区数据")
    @GetMapping(value = "/depth/{depth}")
    public List<SelectTree> regionByDepth(@PathVariable("depth") int depth) {
        return regionService.getByDepth(depth);
    }

    @ApiOperation("所有数据")
    @GetMapping(value = "/all")
    public List<SelectTree> regionAll() {
        return regionService.getAll();
    }

    @ApiOperation("地区列表")
    @PostMapping(value = "/list")
    public PageEntity<?> regionList(PageEntity<?> page) {
        page.startPage();
        page.setList(regionService.getList(page.getParams()));
        return page;
    }

    @ApiOperation("地区添加")
    @PostMapping(value = "/save")
    public RespondedBody regionSave(@RequestBody OtRegion dto) {
        regionService.saveOrUpdateRegion(dto);
        return RespondedBody.successful();
    }
}
