package com.onlythinking.shop.mgt.system.service.Impl;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import com.onlythinking.commons.exception.RespondedException;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.model.MaType;
import com.onlythinking.shop.core.model.SelectOptions;
import com.onlythinking.shop.core.model.SelectType;
import com.onlythinking.shop.core.utils.EncryptionUtils;
import com.onlythinking.shop.mapper.*;
import com.onlythinking.shop.mgt.system.dto.AuthorityDto;
import com.onlythinking.shop.mgt.system.dto.MenuDto;
import com.onlythinking.shop.mgt.system.mapper.InfraSelectDtoMapper;
import com.onlythinking.shop.mgt.system.mapper.OtSysUserDtoMapper;
import com.onlythinking.shop.mgt.system.mapper.SysMenuDtoMapper;
import com.onlythinking.shop.mgt.system.mapper.UniqueValueDtoMapper;
import com.onlythinking.shop.mgt.system.model.OtSysUserView;
import com.onlythinking.shop.mgt.system.service.InfraSystemService;
import com.onlythinking.shop.model.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
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
public class InfraSystemServiceImpl implements InfraSystemService {
    private static final String USER_DEFAULT_PWD = "123123";
    private final OtSysUserMapper sysUserMapper;
    private final OtSysRoleMapper sysRoleMapper;
    private final OtSysMenuMapper sysMenuMapper;
    private final OtSysAuthorityMapper sysAuthorityMapper;
    private final OtSysApiListMapper sysApiListMapper;

    private final OtSysUserRoleRelMapper sysUserRoleRelMapper;
    private final OtSysRoleMenuRelMapper sysRoleMenuRelMapper;
    private final OtSysRoleAuthorityRelMapper sysRoleAuthorityRelMapper;
    private final OtSysMenuAuthorityRelMapper sysMenuAuthorityRelMapper;

    private final InfraSelectDtoMapper infraSelectDtoMapper;
    private final UniqueValueDtoMapper uniqueValueDtoMapper;

    private final SysMenuDtoMapper sysMenuDtoMapper;
    private final OtSysUserDtoMapper sysUserDtoMapper;

    @Override
    @Transactional(readOnly = true)
    public List<SelectOptions> getSelectOptions(SelectType selectType, Map<String, Object> params) {

        switch (selectType) {
            case SYS_USER:
                return infraSelectDtoMapper.getBySysUser(params);
            case ROLE:
                return infraSelectDtoMapper.getByRole(params);
            case JOB_TRIGGER:
                return infraSelectDtoMapper.getByTrigger(params);
            case MA_TYPE:
                Set<String> disabledList = Sets.newHashSet();
                if (null != params.get("disabledList")) {
                    String disabledStr = (String) params.get("disabledList");
                    if (StringUtils.isNotBlank(disabledStr)) {
                        disabledList = Sets.newHashSet(Arrays.asList(StringUtils.split(disabledStr, AppSystem.SEPARATOR_COMMA)));
                    }
                }
                return Lists.newArrayList(
                  new SelectOptions(MaType.wx.name(), "微信", disabledList.contains(MaType.wx.name())),
                  new SelectOptions(MaType.swan.name(), "百度", disabledList.contains(MaType.swan.name())),
                  new SelectOptions(MaType.my.name(), "支付宝", disabledList.contains(MaType.my.name())),
                  new SelectOptions(MaType.tt.name(), "头条", disabledList.contains(MaType.tt.name())),
                  new SelectOptions(MaType.h5.name(), "H5", disabledList.contains(MaType.h5.name()))
                );
        }

        return Lists.newArrayList();
    }

    @Override
    public Map<String, List<SelectOptions>> getSelectOptions(String[] selectTypes, Map<String, Object> params) {
        Map<String, List<SelectOptions>> result = Maps.newHashMap();
        for (String selectType : selectTypes) {
            SelectType type = SelectType.valueOf(selectType);
            List<SelectOptions> options = Lists.newArrayList();
            switch (type) {
                case SYS_USER:
                    options.addAll(infraSelectDtoMapper.getBySysUser(params));
                    break;
                case ROLE:
                    options.addAll(infraSelectDtoMapper.getByRole(params));
                    break;
                case JOB_TRIGGER:
                    options.addAll(infraSelectDtoMapper.getByTrigger(params));
                case MA_TYPE:
                    options.addAll(Lists.newArrayList(
                      new SelectOptions(MaType.wx.name(), "微信", false),
                      new SelectOptions(MaType.swan.name(), "百度", false),
                      new SelectOptions(MaType.my.name(), "支付宝", false),
                      new SelectOptions(MaType.tt.name(), "头条", false),
                      new SelectOptions(MaType.h5.name(), "H5", false)
                      )
                    );
            }
            result.put(selectType, options);
        }
        return result;
    }

    @Override
    @Transactional(readOnly = true)
    public List<OtSysUserView> getSysUserList(Map<String, Object> params) {
        List<OtSysUserView> sysUserViews = sysUserDtoMapper.getSysUserList(params);
        for (OtSysUserView view : sysUserViews) {
            view.fillRoleList();
        }
        return sysUserViews;
    }

    @Override
    public void saveOrUpdateSysUser(OtSysUserView dto) {
        OtSysUser entity = new OtSysUser();
        org.springframework.beans.BeanUtils.copyProperties(dto, entity);
        entity.setAvatar(RandomStringUtils.randomNumeric(5));
        if (StringUtils.isNotBlank(dto.getPwd())) {
            entity.setPassword(EncryptionUtils.md5(dto.getPwd()));
        } else {
            entity.setPassword(EncryptionUtils.md5(USER_DEFAULT_PWD));
        }
        if (StringUtils.isNotBlank(entity.getId())) {
            sysUserMapper.updateByPK(entity);
        } else {
            sysUserMapper.insert(entity);
        }

        if (CollectionUtils.isNotEmpty(dto.getRoleCodes())) {
            grantUserRoles(entity.getId(), dto.getRoleCodes());
        }
    }

    @Override
    public void removeSysUser(String userId) {
        OtSysUser otSysUser = sysUserMapper.getByPK(userId);

        sysUserMapper.deleteByPK(userId);

        List<String> userRoleIds = sysUserRoleRelMapper.getList(ImmutableMap.of("userId", otSysUser.getId()))
          .stream()
          .map(OtSysUserRoleRel::getId).collect(Collectors.toList());

        if (CollectionUtils.isNotEmpty(userRoleIds)) {
            sysUserRoleRelMapper.deleteInBatch(userRoleIds);
        }
    }

    @Override
    public void changeStatusSysUser(String userId, Boolean active) {
        sysUserMapper.updateBySelective(ImmutableMap.of(
          "id", userId,
          "active", active,
          "remark", active ? "激活用户" : "锁定用户"
        ));
    }

    @Override
    @Transactional(readOnly = true)
    public List<OtSysRole> getSysRoleList(Map<String, Object> params) {
        return sysRoleMapper.getList(params);
    }

    @Override
    public List<OtSysRoleMenuRel> sysRoleMenuList(String roleId) {
        return sysRoleMenuRelMapper.getList(ImmutableMap.of("roleId", roleId));
    }

    @Override
    public List<OtSysRoleAuthorityRel> sysRoleAuthorities(String roleId) {
        return sysRoleAuthorityRelMapper.getList(ImmutableMap.of("roleId", roleId));
    }

    @Override
    public void saveOrUpdateSysRole(OtSysRole entity) {
        if (StringUtils.isNotBlank(entity.getId())) {
            sysRoleMapper.updateByPK(entity);
        } else {
            entity.setId(entity.getRoleCode());
            sysRoleMapper.insert(entity);
        }
    }

    @Override
    public void removeSysRole(String id) {

        // 检验用户角色关系表是否存在数据
        Long userRoleTotal = sysMenuDtoMapper.countUserRoleByRoleId(id);
        if (userRoleTotal > 0) {
            log.info("该角色有用户关联数据 {}", userRoleTotal);
            throw RespondedException.violationError("{mgt.system.role.remove.pre}");
        }

        OtSysRole otSysRole = sysRoleMapper.getByPK(id);

        sysRoleMapper.deleteByPK(id);

        List<String> roleMenuIds = sysRoleMenuRelMapper.getList(ImmutableMap.of("roleId", otSysRole.getId()))
          .stream()
          .map(OtSysRoleMenuRel::getId).collect(Collectors.toList());

        if (CollectionUtils.isNotEmpty(roleMenuIds)) {
            sysRoleMenuRelMapper.deleteInBatch(roleMenuIds);
        }

    }

    @Override
    @Transactional(readOnly = true)
    public List<OtSysMenu> getSysMenuList(Map<String, Object> params) {
        return sysMenuDtoMapper.getMenus(params);
    }

    @Override
    @Transactional(readOnly = true)
    public List<MenuDto> getSysMenuTreeList(String parentId) {
        List<MenuDto> menus = Lists.newArrayList();
        List<OtSysMenu> rootMenus = sysMenuDtoMapper.getMenusByParentId(parentId);
        for (OtSysMenu parent : rootMenus) {
            MenuDto parentDto = MenuDto.of(sysMenuMapper.getByPK(parent.getId()));
            if (null == parentDto) {
                return menus;
            }
            menus.add(parentDto);
            recursiveFindChild(parentDto, menus);
        }
        recursiveSort(menus);
        return menus;
    }

    private void recursiveSort(List<MenuDto> children) {
        if (CollectionUtils.isEmpty(children)) {
            return;
        }
        Collections.sort(children);
        for (MenuDto parent : children) {
            recursiveSort(parent.getChildren());
        }
    }

    private void recursiveFindChild(MenuDto parent, List<MenuDto> menus) {
        List<OtSysMenu> childes = sysMenuDtoMapper.getMenusByParentId(parent.getId());
        if (CollectionUtils.isEmpty(childes)) {
            return;
        }
        for (OtSysMenu c : childes) {
            MenuDto child = MenuDto.of(c);
            parent.getChildren().add(child);
            recursiveFindChild(child, menus);
        }
    }

    @Override
    public void saveOrUpdateSysMenu(OtSysMenu entity) {
        if (StringUtils.isNotBlank(entity.getId())) {
            sysMenuMapper.updateByPK(entity);
        } else {
            sysMenuMapper.insert(entity);
            // 更新半选状态（为修复Element-ui tree 问题）
            String parentId = entity.getParentId();
            if (StringUtils.isBlank(parentId)) {
                return;
            }
            List<OtSysRoleMenuRel> sysRoleMenuRels = sysRoleMenuRelMapper.getList(ImmutableMap.of("menuId", parentId));
            if (CollectionUtils.isNotEmpty(sysRoleMenuRels)) {
                for (OtSysRoleMenuRel db : sysRoleMenuRels) {
                    OtSysRoleMenuRel roleMenuRel = new OtSysRoleMenuRel();
                    roleMenuRel.setHalf(Boolean.TRUE);
                    roleMenuRel.setId(db.getId());
                    sysRoleMenuRelMapper.updateByPK(roleMenuRel);
                }
            }
        }
    }

    @Override
    public void removeSysMenu(String parentId) {
        List<String> ids = Lists.newArrayList();
        recursiveFind(sysMenuMapper.getByPK(parentId), ids);
        if (log.isDebugEnabled()) {
            log.debug("待删除的目录 {}", ids);
        }

        // 检验角色菜单关系表是否存在数据
        if (CollectionUtils.isNotEmpty(ids)) {
            Long roleMenuIds = sysMenuDtoMapper.countRoleMenuByMenuIds(ids);
            if (roleMenuIds > 0) {
                log.info("该菜单存在角色菜单关联数据 {}", roleMenuIds);
                throw RespondedException.violationError("{mgt.system.menu.remove.pre}");
            }
        }
        sysMenuMapper.deleteInBatch(ids);
    }

    @Override
    @Transactional(readOnly = true)
    public OtSysMenu getSysMenu(String id) {
        return sysMenuMapper.getByPK(id);
    }

    @Override
    public List<OtSysMenuAuthorityRel> sysMenuAuthorities(String menuId) {
        return sysMenuAuthorityRelMapper.getList(ImmutableMap.of("menuId", menuId));
    }

    @Override
    public List<OtSysAuthority> getSysAuthorityList(Map<String, Object> params) {
        return sysAuthorityMapper.getList(params);
    }

    @Override
    public List<AuthorityDto> getSysAuthorityTreeList(Map<String, Object> params) {

        // 过滤 bindType('role', 'menu') bindId
        String bindType = (String) params.get("bindType");
        String bindId = (String) params.get("bindId");

        List<AuthorityDto> authorities = Lists.newArrayList();
        List<OtSysAuthority> rootAuthorities = sysMenuDtoMapper.getAuthorityByParentId(null);
        for (OtSysAuthority parent : rootAuthorities) {
            AuthorityDto parentDto = AuthorityDto.of(sysAuthorityMapper.getByPK(parent.getId()));
            if (null == parentDto) {
                return authorities;
            }
            authorities.add(parentDto);
            recursiveFindChildAuthority(parentDto, authorities);
        }
        return authorities;
    }

    private void recursiveFindChildAuthority(AuthorityDto parent, List<AuthorityDto> authorities) {
        List<OtSysAuthority> childes = sysMenuDtoMapper.getAuthorityByParentId(parent.getId());
        if (CollectionUtils.isEmpty(childes)) {
            return;
        }
        for (OtSysAuthority c : childes) {
            AuthorityDto child = AuthorityDto.of(c);
            parent.getChildren().add(child);
            recursiveFindChildAuthority(child, authorities);
        }
    }

    @Override
    public void saveOrUpdateSysAuthority(OtSysAuthority entity) {
        if (StringUtils.isNotBlank(entity.getId())) {
            sysAuthorityMapper.updateByPK(entity);
        } else {
            entity.setId(entity.getId());
            sysAuthorityMapper.insert(entity);
        }
    }

    @Override
    public void removeSysAuthority(String id) {
        OtSysAuthority authority = sysAuthorityMapper.getByPK(id);
        if (log.isDebugEnabled()) {
            log.debug("待删除的API权限 {}", authority);
        }

        // 检验角色菜单关系表是否存在数据
        if (null != authority) {
            List<OtSysRoleAuthorityRel> roleAuthorityRels = sysRoleAuthorityRelMapper.getList(ImmutableMap.of("authorityId", authority.getId()));
            if (CollectionUtils.isNotEmpty(roleAuthorityRels)) {
                log.info("该API权限存在角色权限关联数据 {}", roleAuthorityRels);
                throw RespondedException.violationError("{mgt.system.authority_role.remove.pre}");
            }

            List<OtSysMenuAuthorityRel> menuAuthorityRels = sysMenuAuthorityRelMapper.getList(ImmutableMap.of("authorityId", authority.getId()));
            if (CollectionUtils.isNotEmpty(menuAuthorityRels)) {
                log.info("该API权限存在菜单权限关联数据 {}", menuAuthorityRels);
                throw RespondedException.violationError("{mgt.system.authority_menu.remove.pre}");
            }
            sysAuthorityMapper.deleteByPK(authority.getId());
        }
    }

    @Override
    public OtSysAuthority getSysAuthority(String id) {
        return sysAuthorityMapper.getByPK(id);
    }

    @Override
    public List<OtSysAuthority> sysAuthorityList(Map<String, Object> params) {
        return sysMenuDtoMapper.getSysRoleAuthority(params);
    }

    @Override
    public List<OtSysApiList> getSysApiList(Map<String, Object> params) {
        return sysApiListMapper.getList(params);
    }

    @Override
    public void saveOrUpdateSysApiList(OtSysApiList entity) {
        if (StringUtils.isNotBlank(entity.getId())) {
            sysApiListMapper.updateByPK(entity);
        } else {
            entity.setId(entity.getId());
            sysApiListMapper.insert(entity);
        }
    }

    @Override
    public void removeSysApiList(String id) {
        sysApiListMapper.deleteByPK(id);
    }

    private void recursiveFind(OtSysMenu parent, List<String> ids) {
        ids.add(parent.getId());
        List<OtSysMenu> childes = sysMenuDtoMapper.getMenusByParentId(parent.getId());
        if (CollectionUtils.isEmpty(childes)) {
            return;
        }
        for (OtSysMenu child : childes) {
            recursiveFind(child, ids);
        }
    }

    @Override
    public void grantUserRoles(String userId, List<String> rolesId) {
        List<OtSysUserRoleRel> userRoleRels = sysUserRoleRelMapper.getList(ImmutableMap.of("userId", userId));

        if (!CollectionUtils.isEmpty(userRoleRels)) {
            sysUserRoleRelMapper.deleteInBatch(userRoleRels.stream().map(OtSysUserRoleRel::getId).collect(Collectors.toList()));
        }

        OtSysUser user = sysUserMapper.getByPK(userId);

        for (String roleId : rolesId) {
            OtSysUserRoleRel userRoleRel = new OtSysUserRoleRel();
            userRoleRel.setUserId(user.getId());
            OtSysRole role = sysRoleMapper.getByPK(roleId);
            if (null == role) {
                throw RespondedException.argumentInvalid("{mgt.system.grantUserRoles.role.null}", roleId);
            }
            userRoleRel.setRoleId(role.getId());
            sysUserRoleRelMapper.insert(userRoleRel);
        }
    }

    @Override
    public void grantRoleMenus(String roleId, List<String> menuIds, List<String> haftMenuIds) {
        List<OtSysRoleMenuRel> roleMenuRels = sysRoleMenuRelMapper.getList(ImmutableMap.of("roleId", roleId));

        if (CollectionUtils.isNotEmpty(roleMenuRels)) {
            sysRoleMenuRelMapper.deleteInBatch(roleMenuRels.stream().map(OtSysRoleMenuRel::getId).collect(Collectors.toList()));
        }

        OtSysRole role = sysRoleMapper.getByPK(roleId);

        if (null == role) {
            throw RespondedException.argumentInvalid("{mgt.system.grantUserRoles.role.null}", roleId);
        }

        for (String menuId : menuIds) {
            OtSysRoleMenuRel roleMenuRel = new OtSysRoleMenuRel();
            roleMenuRel.setRoleId(role.getId());
            OtSysMenu menu = sysMenuMapper.getByPK(menuId);
            if (null == menu) {
                throw RespondedException.argumentInvalid("{mgt.system.grantUserRoles.menu.null}", menuId);
            }
            roleMenuRel.setMenuId(menu.getId());
            roleMenuRel.setHalf(Boolean.FALSE);
            sysRoleMenuRelMapper.insert(roleMenuRel);
        }

        if (CollectionUtils.isNotEmpty(haftMenuIds)) {
            for (String menuId : haftMenuIds) {
                OtSysRoleMenuRel roleMenuRel = new OtSysRoleMenuRel();
                roleMenuRel.setRoleId(role.getId());
                OtSysMenu menu = sysMenuMapper.getByPK(menuId);
                if (null == menu) {
                    throw RespondedException.argumentInvalid("{mgt.system.grantUserRoles.menu.null}", menuId);
                }
                roleMenuRel.setMenuId(menu.getId());
                roleMenuRel.setHalf(Boolean.TRUE);
                sysRoleMenuRelMapper.insert(roleMenuRel);
            }
        }

    }

    @Override
    public void grantRolePermissions(String roleId, List<String> authorityIds) {
        List<OtSysRoleAuthorityRel> roleAuthorityRels = sysRoleAuthorityRelMapper.getList(ImmutableMap.of("roleId", roleId));

        if (CollectionUtils.isNotEmpty(roleAuthorityRels)) {
            sysRoleAuthorityRelMapper.deleteInBatch(roleAuthorityRels.stream().map(OtSysRoleAuthorityRel::getId).collect(Collectors.toList()));
        }

        OtSysRole role = sysRoleMapper.getByPK(roleId);

        if (null == role) {
            throw RespondedException.argumentInvalid("{mgt.system.grantUserRoles.role.null}", roleId);
        }

        for (String authorityId : authorityIds) {
            OtSysRoleAuthorityRel roleAuthorityRel = new OtSysRoleAuthorityRel();
            roleAuthorityRel.setRoleId(role.getId());
            OtSysAuthority authority = sysAuthorityMapper.getByPK(authorityId);
            if (null == authority) {
                throw RespondedException.argumentInvalid("{mgt.system.grantUserRoles.authority.null}", authorityId);
            }
            roleAuthorityRel.setAuthorityId(authority.getId());
            sysRoleAuthorityRelMapper.insert(roleAuthorityRel);
        }
    }

    @Override
    public void grantMenuPermissions(String menuId, List<String> authorityIds) {
        List<OtSysMenuAuthorityRel> menuAuthorityRels = sysMenuAuthorityRelMapper.getList(ImmutableMap.of("menuId", menuId));

        if (CollectionUtils.isNotEmpty(menuAuthorityRels)) {
            sysMenuAuthorityRelMapper.deleteInBatch(menuAuthorityRels.stream().map(OtSysMenuAuthorityRel::getId).collect(Collectors.toList()));
        }

        OtSysMenu menu = sysMenuMapper.getByPK(menuId);

        if (null == menu) {
            throw RespondedException.argumentInvalid("{mgt.system.grantUserRoles.menu.null}", menuId);
        }

        for (String authorityId : authorityIds) {
            OtSysMenuAuthorityRel menuAuthorityRel = new OtSysMenuAuthorityRel();
            menuAuthorityRel.setMenuId(menu.getId());
            OtSysAuthority authority = sysAuthorityMapper.getByPK(authorityId);
            if (null == authority) {
                throw RespondedException.argumentInvalid("{mgt.system.grantUserRoles.authority.null}", authorityId);
            }
            menuAuthorityRel.setAuthorityId(authority.getId());
            sysMenuAuthorityRelMapper.insert(menuAuthorityRel);
        }
    }

    @Override
    public void batchGrantUserRoles(List<String> userIds, List<String> rolesId) {
        for (String userId : userIds) {
            this.grantUserRoles(userId, rolesId);
        }
    }

    @Override
    public void batchGrantRoleMenus(List<String> roleIds, List<String> menuIds, List<String> haftMenuIds) {
        for (String roleId : roleIds) {
            this.grantRoleMenus(roleId, menuIds, haftMenuIds);
        }
    }

    @Override
    public void batchGrantRolePermissions(List<String> roleIds, List<String> authorityIds) {
        for (String roleId : roleIds) {
            this.grantRolePermissions(roleId, authorityIds);
        }
    }

    @Override
    public void batchGrantMenuPermissions(List<String> menuIds, List<String> authorityIds) {
        for (String menuId : menuIds) {
            this.grantMenuPermissions(menuId, authorityIds);
        }
    }

    @Override
    public Long uniqueValue(SelectType selectType, Map<String, Object> params) {
        switch (selectType) {
            case MENU_PATH:
                return uniqueValueDtoMapper.countMenuPath(params);
            case APP_NO:
                return uniqueValueDtoMapper.countAppNo(params);
        }
        return null;
    }

}
