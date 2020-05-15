package com.onlythinking.shop.mgt.system.mapper;

import com.onlythinking.shop.model.OtSysAuthority;
import com.onlythinking.shop.model.OtSysMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface SysMenuDtoMapper {

    List<OtSysMenu> getMenus(Map<String, Object> params);

    List<OtSysMenu> getMenusByParentId(@Param("parentId") String parentId);

    List<OtSysAuthority> getAuthorityByParentId(@Param("parentId") String parentId);

    Long countRoleMenuByMenuIds(List<String> menuIds);

    Long countUserRoleByRoleId(@Param("roleId") String roleId);

    List<OtSysAuthority> getSysRoleAuthority(Map<String, Object> params);
}

