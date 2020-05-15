package com.onlythinking.shop.mgt.core.mapper;

import com.onlythinking.shop.model.OtSysMenu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ShiroRelamMapper {

    List<String> findRoleCodes(Map<String, Object> params);

    List<String> findPermissionsByRole(Map<String, Object> params);

    List<String> findPermissionsByMenu(Map<String, Object> params);

    List<OtSysMenu> findMenus(Map<String, Object> params);
}
