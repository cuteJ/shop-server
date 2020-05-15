package com.onlythinking.shop.mgt.system.mapper;

import com.onlythinking.shop.core.model.SelectOptions;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @author lixingping
 */
@Mapper
public interface InfraSelectDtoMapper {

    List<SelectOptions> getByRole(Map<String, Object> params);

    List<SelectOptions> getBySysUser(Map<String, Object> params);

    List<SelectOptions> getByTrigger(Map<String, Object> params);

}
