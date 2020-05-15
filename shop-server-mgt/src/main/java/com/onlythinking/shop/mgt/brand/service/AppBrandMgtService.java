package com.onlythinking.shop.mgt.brand.service;

import com.onlythinking.shop.core.service.OtBasicService;
import com.onlythinking.shop.mapper.OtAppBrandMapper;
import com.onlythinking.shop.mgt.brand.dto.OtAppBrandViewDto;
import com.onlythinking.shop.model.OtAppBrand;
import com.onlythinking.shop.model.OtAppMaConfig;

import java.util.List;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface AppBrandMgtService extends OtBasicService<OtAppBrand, OtAppBrandMapper> {

    OtAppBrandViewDto getAppBrandDetails(String id);

    void saveOrUpdateBrand(OtAppBrandViewDto dto);

    void removeAppBrand(String id);

    void removeAppMaConfig(String id);

    void saveOrUpdateMaConfig(OtAppMaConfig dto);

    List<OtAppMaConfig> getAppBrandMaConfig(String id);
}
