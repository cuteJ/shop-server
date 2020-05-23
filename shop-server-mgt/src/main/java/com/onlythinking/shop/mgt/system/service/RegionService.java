package com.onlythinking.shop.mgt.system.service;

import com.onlythinking.shop.core.model.SelectTree;
import com.onlythinking.shop.core.service.OtBasicService;
import com.onlythinking.shop.mapper.OtRegionMapper;
import com.onlythinking.shop.model.OtRegion;

import java.util.List;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface RegionService extends OtBasicService<OtRegion, OtRegionMapper> {

    void initRegion(Map<String, String> data, int depth);

    List<SelectTree> getAll();

    List<SelectTree> getByPid(String parentId);

    List<SelectTree> getByDepth(int depth);

    List<SelectTree> getByDepthShortName(int depth);

    void saveOrUpdateRegion(OtRegion dto);
}
