package com.onlythinking.shop.mgt.brand.service.impl;

import com.google.common.collect.ImmutableMap;
import com.onlythinking.shop.core.utils.UUIDUtils;
import com.onlythinking.shop.mapper.OtAppBrandMapper;
import com.onlythinking.shop.mapper.OtAppMaConfigMapper;
import com.onlythinking.shop.mgt.brand.dto.OtAppBrandViewDto;
import com.onlythinking.shop.mgt.brand.service.AppBrandMgtService;
import com.onlythinking.shop.model.OtAppBrand;
import com.onlythinking.shop.model.OtAppMaConfig;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
@Transactional
public class AppBrandMgtServiceImpl implements AppBrandMgtService {

    private final OtAppMaConfigMapper appMaConfigMapper;
    private final OtAppBrandMapper appBrandMapper;

    @Override
    public OtAppBrandMapper getMapper() {
        return appBrandMapper;
    }

    @Override
    public OtAppBrandViewDto getAppBrandDetails(String id) {
        OtAppBrand appBrand = appBrandMapper.getByPK(id);
        List<OtAppMaConfig> maConfigs = appMaConfigMapper.getList(ImmutableMap.of("aid", appBrand.getId()));
        OtAppBrandViewDto viewDto = new OtAppBrandViewDto();
        BeanUtils.copyProperties(appBrand, viewDto);
        viewDto.setMaConfigs(maConfigs);
        return viewDto;
    }

    @Override
    public void saveOrUpdateBrand(OtAppBrandViewDto entity) {
        if (StringUtils.isNotBlank(entity.getId())) {
            entity.setLastModifiedTime(new Date());
            appBrandMapper.updateByPK(entity);
        } else {
            entity.setId(UUIDUtils.getUUID());
            entity.setCreatedTime(new Date());
            appBrandMapper.insert(entity);
        }

        if (CollectionUtils.isNotEmpty(entity.getMaConfigs())) {
            for (OtAppMaConfig config : entity.getMaConfigs()) {
                this.saveOrUpdateMaConfig(config);
            }
        }
    }

    @Override
    public void removeAppBrand(String id) {
        OtAppBrand appBrand = appBrandMapper.getByPK(id);
        List<OtAppMaConfig> maConfigs = appMaConfigMapper.getList(ImmutableMap.of("aid", appBrand.getId()));
        if (CollectionUtils.isNotEmpty(maConfigs)) {
            appMaConfigMapper.deleteInBatch(maConfigs.stream().map(OtAppMaConfig::getId).collect(Collectors.toList()));
        }
        appBrandMapper.deleteByPK(appBrand.getId());
    }

    @Override
    public void removeAppMaConfig(String id) {
        appMaConfigMapper.deleteByPK(id);
    }

    @Override
    public void saveOrUpdateMaConfig(OtAppMaConfig entity) {
        if (StringUtils.isNotBlank(entity.getId())) {
            appMaConfigMapper.updateByPK(entity);
        } else {
            appMaConfigMapper.insert(entity);
        }
    }

    @Override
    public List<OtAppMaConfig> getAppBrandMaConfig(String id) {
        return appMaConfigMapper.getList(ImmutableMap.of("aid", id));
    }
}
