package com.onlythinking.shop.mgt.system.service;

import com.onlythinking.shop.core.model.SelectOptions;
import com.onlythinking.shop.core.model.SelectType;
import com.onlythinking.shop.mgt.system.dto.AuthorityDto;
import com.onlythinking.shop.mgt.system.dto.MenuDto;
import com.onlythinking.shop.mgt.system.model.OtSysUserView;
import com.onlythinking.shop.model.*;

import java.util.List;
import java.util.Map;

/**
 * <p> 用户|角色|菜单 </p>
 *
 * @author Li Xingping
 */
public interface InfraSystemService {

    /**
     * 选项类别
     *
     * @param selectType 类型
     * @param params     查询参数
     * @return List
     */
    List<SelectOptions> getSelectOptions(SelectType selectType, Map<String, Object> params);

    /**
     * 获取多个类型
     *
     * @param selectTypes 类型
     * @param params      过滤参数
     */
    Map<String, List<SelectOptions>> getSelectOptions(String[] selectTypes, Map<String, Object> params);

    // 系统用户
    List<OtSysUserView> getSysUserList(Map<String, Object> params);

    void saveOrUpdateSysUser(OtSysUserView entity);

    void removeSysUser(String userId);

    void changeStatusSysUser(String userId, Boolean active);

    // 系统角色
    List<OtSysRole> getSysRoleList(Map<String, Object> params);

    List<OtSysRoleMenuRel> sysRoleMenuList(String roleId);

    List<OtSysRoleAuthorityRel> sysRoleAuthorities(String roleId);

    void saveOrUpdateSysRole(OtSysRole entity);

    void removeSysRole(String id);

    // 系统菜单目录
    List<OtSysMenu> getSysMenuList(Map<String, Object> params);

    List<MenuDto> getSysMenuTreeList(String parentId);

    void saveOrUpdateSysMenu(OtSysMenu entity);

    void removeSysMenu(String id);

    OtSysMenu getSysMenu(String id);

    List<OtSysMenuAuthorityRel> sysMenuAuthorities(String menuId);

    // 权限
    List<OtSysAuthority> getSysAuthorityList(Map<String, Object> params);

    List<AuthorityDto> getSysAuthorityTreeList(Map<String, Object> params);

    void saveOrUpdateSysAuthority(OtSysAuthority entity);

    void removeSysAuthority(String id);

    OtSysAuthority getSysAuthority(String id);

    // 获取所有权限列表
    List<OtSysAuthority> sysAuthorityList(Map<String, Object> params);

    // API列表
    List<OtSysApiList> getSysApiList(Map<String, Object> params);

    void saveOrUpdateSysApiList(OtSysApiList entity);

    void removeSysApiList(String id);

    // 授权用户角色
    void grantUserRoles(String userId, List<String> roleIds);

    // 授权角色菜单
    void grantRoleMenus(String roleId, List<String> menuIds, List<String> haftMenuIds);

    // 授权角色API权限
    void grantRolePermissions(String roleId, List<String> authorityIds);

    // 授权菜单API权限
    void grantMenuPermissions(String menuId, List<String> authorityIds);

    void batchGrantUserRoles(List<String> userIds, List<String> rolesId);

    void batchGrantRoleMenus(List<String> roleIds, List<String> menuIds, List<String> haftMenuIds);

    void batchGrantRolePermissions(List<String> roleIds, List<String> authorityIds);

    void batchGrantMenuPermissions(List<String> menuIds, List<String> authorityIds);

    Long uniqueValue(SelectType selectType, Map<String, Object> params);
}
