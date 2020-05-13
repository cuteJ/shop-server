package com.onlythinking.shop.app.brand.service.impl;

import com.google.common.collect.ImmutableMap;
import com.onlythinking.shop.app.brand.dto.AppMaConfigDto;
import com.onlythinking.shop.app.brand.service.AppBrandService;
import com.onlythinking.shop.core.model.MaType;
import com.onlythinking.shop.mapper.OtAppMaConfigMapper;
import com.onlythinking.shop.model.OtAppMaConfig;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
public class AppBrandServiceImpl implements AppBrandService {

    private final OtAppMaConfigMapper appMaConfigMapper;

    @Override
    public AppMaConfigDto getByAppNoAndMaType(String appNo, MaType maType) {
        OtAppMaConfig db = appMaConfigMapper.getOne(ImmutableMap.of("appNo", appNo, "maType", maType.name()));
        if (null == db) {
            return null;
        }
        AppMaConfigDto dto = new AppMaConfigDto();
        dto.setAppId(db.getAppId());
        dto.setAppNo(db.getAppNo());
        dto.setAppKey(db.getAppKey());
        return dto;
    }

    @Override
    public List<OtAppMaConfig> getList(Map<String, Object> params) {
        return appMaConfigMapper.getList(params);
    }

    @Override
    public Map<MaType, List<OtAppMaConfig>> getAll() {
        List<OtAppMaConfig> configs = appMaConfigMapper.getList(new HashMap<>());
        if (CollectionUtils.isNotEmpty(configs)) {
            return configs.stream().collect(Collectors.groupingBy(v -> MaType.valueOf(v.getMaType())));
        }
        return null;
    }
}
