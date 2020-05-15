package com.onlythinking.shop.mgt.system.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

/**
 * @author lixingping
 */
@Mapper
public interface UniqueValueDtoMapper {

    Long countMenuPath(Map<String, Object> params);

    Long countAppNo(Map<String, Object> params);
}
