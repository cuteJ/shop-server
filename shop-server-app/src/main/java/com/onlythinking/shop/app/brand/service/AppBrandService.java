package com.onlythinking.shop.app.brand.service;

import com.onlythinking.shop.app.brand.dto.AppMaConfigDto;
import com.onlythinking.shop.core.model.MaType;
import com.onlythinking.shop.model.OtAppMaConfig;

import java.util.List;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface AppBrandService {

    AppMaConfigDto getByAppNoAndMaType(String appNo, MaType maType);

    List<OtAppMaConfig> getList(Map<String, Object> params);

    Map<MaType, List<OtAppMaConfig>> getAll();

}
