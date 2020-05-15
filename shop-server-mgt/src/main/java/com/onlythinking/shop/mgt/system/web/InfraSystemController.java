package com.onlythinking.shop.mgt.system.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.commons.exception.RespondedBody;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.model.SelectOptions;
import com.onlythinking.shop.core.model.SelectType;
import com.onlythinking.shop.core.page.PageEntity;
import com.onlythinking.shop.mapper.OtSysAuthorityMapper;
import com.onlythinking.shop.mgt.core.utils.ClassScanner;
import com.onlythinking.shop.mgt.system.dto.AuthorityDto;
import com.onlythinking.shop.mgt.system.dto.GrantDto;
import com.onlythinking.shop.mgt.system.dto.MenuDto;
import com.onlythinking.shop.mgt.system.model.OtSysUserView;
import com.onlythinking.shop.mgt.system.service.InfraSystemService;
import com.onlythinking.shop.model.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import static com.onlythinking.shop.mgt.core.constant.PermissionsConstant.*;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "基础")
@ApiRest(serviceId = AppSystem.SERVER_SYS)
public class InfraSystemController {

    private final InfraSystemService infraSystemService;

    @ApiOperation("唯一值检测")
    @PostMapping("/unique/{selectType}")
    public Long uniqueValue(@PathVariable("selectType") SelectType selectType,
                            @RequestParam(required = false) Map<String, Object> params) {
        return infraSystemService.uniqueValue(selectType, params);
    }

    @ApiOperation("类别选择")
    @PostMapping("/select/{selectType}")
    public List<SelectOptions> selectOptions(@PathVariable("selectType") SelectType selectType,
                                             @RequestParam(required = false) Map<String, Object> params) {
        return infraSystemService.getSelectOptions(selectType, params);
    }

    @ApiOperation("类别选择")
    @PostMapping("/selects/{selectTypes}")
    public Map<String, List<SelectOptions>> selectOptions(@PathVariable("selectTypes") String selectTypes,
                                                          @RequestParam(required = false) Map<String, Object> params) {
        return infraSystemService.getSelectOptions(StringUtils.split(selectTypes, AppSystem.SEPARATOR_COMMA), params);
    }

    @ApiOperation("系统用户列表")
    @RequiresPermissions(value = SYS_USER_LIST)
    @PostMapping(value = "/user/list")
    public PageEntity<?> sysUserList(PageEntity<?> page) {
        page.startPage();
        page.setList(infraSystemService.getSysUserList(page.getParams()));
        return page;
    }

    @ApiOperation("系统用户添加")
    @RequiresPermissions(value = SYS_USER_SAVE)
    @PostMapping(value = "/user/save")
    public RespondedBody sysUserSave(@RequestBody OtSysUserView dto) {
        infraSystemService.saveOrUpdateSysUser(dto);
        return RespondedBody.successful();
    }

    @ApiOperation("系统用户激活|锁定")
    @RequiresPermissions(value = SYS_USER_LOCK)
    @PutMapping(value = "/user/status/{id}/{active}")
    public RespondedBody sysUserStatus(@PathVariable("id") String id, @PathVariable("active") Boolean active) {
        infraSystemService.changeStatusSysUser(id, active);
        return RespondedBody.successful();
    }

    @ApiOperation("系统用户移除")
    @RequiresPermissions(value = SYS_USER_REMOVE)
    @DeleteMapping(value = "/user/remove/{id}")
    public RespondedBody sysUserRemove(@PathVariable("id") String id) {
        infraSystemService.removeSysUser(id);
        return RespondedBody.successful();
    }

    @ApiOperation("系统角色列表")
    @RequiresPermissions(value = SYS_ROLE_LIST)
    @PostMapping(value = "/role/list")
    public PageEntity<?> sysRoleList(PageEntity<?> page) {
        page.startPage();
        page.setList(infraSystemService.getSysRoleList(page.getParams()));
        return page;
    }

    @ApiOperation("系统角色菜单列表")
    @RequiresPermissions(value = SYS_ROLE_LIST)
    @GetMapping(value = "/role/menu/{roleId}")
    public List<String> sysRoleMenuList(@PathVariable("roleId") String roleId) {
        return infraSystemService.sysRoleMenuList(roleId)
          .stream().filter((v) -> v.getHalf() == null || Boolean.FALSE.equals(v.getHalf())).map(OtSysRoleMenuRel::getMenuId).collect(Collectors.toList());
    }

    @ApiOperation("系统角色权限列表")
    @RequiresPermissions(value = SYS_ROLE_LIST)
    @GetMapping(value = "/role/authorities/{roleId}")
    public Set<String> sysRoleAuthorities(@PathVariable("roleId") String roleId) {
        return infraSystemService.sysRoleAuthorities(roleId)
          .stream().map(OtSysRoleAuthorityRel::getAuthorityId).collect(Collectors.toSet());
    }

    @ApiOperation("系统角色添加")
    @RequiresPermissions(value = SYS_ROLE_SAVE)
    @PostMapping(value = "/role/save")
    public RespondedBody sysRoleSave(@RequestBody OtSysRole dto) {
        infraSystemService.saveOrUpdateSysRole(dto);
        return RespondedBody.successful();
    }

    @ApiOperation("系统角色移除")
    @RequiresPermissions(value = SYS_ROLE_REMOVE)
    @DeleteMapping(value = "/role/remove/{id}")
    public RespondedBody sysRoleRemove(@PathVariable("id") String id) {
        infraSystemService.removeSysRole(id);
        return RespondedBody.successful();
    }

    @ApiOperation("系统菜单列表")
    @RequiresPermissions(value = SYS_MENU_LIST)
    @PostMapping(value = "/menu/list")
    public List<MenuDto> sysMenuList(@RequestParam Map<String, Object> params) {
        return infraSystemService.getSysMenuList(params)
          .stream().map(MenuDto::of).sorted().collect(Collectors.toList());
    }

    @ApiOperation("系统菜单树形列表")
    @RequiresPermissions(value = SYS_MENU_LIST)
    @PostMapping(value = "/menu/tree_list")
    public List<MenuDto> sysMenuTreeList(@RequestParam("parentId") String parentId) {
        return infraSystemService.getSysMenuTreeList(parentId);
    }

    @ApiOperation("系统菜单详情")
    @RequiresPermissions(value = SYS_MENU_LIST)
    @GetMapping(value = "/menu/detail/{id}")
    public OtSysMenu detail(@PathVariable("id") String id) {
        return infraSystemService.getSysMenu(id);
    }

    @ApiOperation("系统菜单添加")
    @RequiresPermissions(value = SYS_MENU_SAVE)
    @PostMapping(value = "/menu/save")
    public RespondedBody sysMenuSave(@RequestBody OtSysMenu dto) {
        infraSystemService.saveOrUpdateSysMenu(dto);
        return RespondedBody.successful();
    }

    @ApiOperation("系统菜单移除")
    @RequiresPermissions(value = SYS_MENU_REMOVE)
    @DeleteMapping(value = "/menu/remove/{id}")
    public RespondedBody sysMenuRemove(@PathVariable("id") String id) {
        infraSystemService.removeSysMenu(id);
        return RespondedBody.successful();
    }

    @ApiOperation("系统菜单权限列表")
    @RequiresPermissions(value = SYS_MENU_GRANT)
    @GetMapping(value = "/menu/authorities/{menuId}")
    public Set<String> sysMenuAuthorities(@PathVariable("menuId") String menuId) {
        return infraSystemService.sysMenuAuthorities(menuId)
          .stream().map(OtSysMenuAuthorityRel::getAuthorityId).collect(Collectors.toSet());
    }

    @ApiOperation("系统权限列表")
    @RequiresPermissions(value = SYS_AUTHORITY_LIST)
    @PostMapping(value = "/authority/list")
    public PageEntity<?> sysAuthorityList(PageEntity<?> page) {
        page.startPage();
        page.setList(infraSystemService.getSysAuthorityList(page.getParams()));
        return page;
    }

    @ApiOperation("系统权限列表")
    @RequiresPermissions(value = SYS_AUTHORITY_LIST)
    @PostMapping(value = "/authority/_list")
    public List<OtSysAuthority> sysAuthorityList(Map<String, Object> params) {
        return infraSystemService.getSysAuthorityList(params);
    }

    @ApiOperation("系统权限列表")
    @RequiresPermissions(value = SYS_AUTHORITY_LIST)
    @PostMapping(value = "/authority/tree_list")
    public List<AuthorityDto> sysAuthorityTreeList(Map<String, Object> params) {
        return infraSystemService.getSysAuthorityTreeList(params);
    }

    @ApiOperation("系统权限列表")
    @RequiresPermissions(value = SYS_AUTHORITY_LIST)
    @PostMapping(value = "/authority/select")
    public List<OtSysAuthority> sysAuthoritySelect(@RequestParam Map<String, Object> params) {
        return infraSystemService.sysAuthorityList(params);
    }

    @ApiOperation("系统权限添加")
    @RequiresPermissions(value = SYS_AUTHORITY_SAVE)
    @PostMapping(value = "/authority/save")
    public RespondedBody sysAuthoritySave(@RequestBody OtSysAuthority dto) {
        infraSystemService.saveOrUpdateSysAuthority(dto);
        return RespondedBody.successful();
    }

    @ApiOperation("系统权限移除")
    @RequiresPermissions(value = SYS_AUTHORITY_REMOVE)
    @DeleteMapping(value = "/authority/remove/{id}")
    public RespondedBody sysAuthorityRemove(@PathVariable("id") String id) {
        infraSystemService.removeSysAuthority(id);
        return RespondedBody.successful();
    }

    @ApiOperation("API列表")
    @RequiresPermissions(value = SYS_APILIST_LIST)
    @PostMapping(value = "/apiList/list")
    public PageEntity<?> sysApiList(PageEntity<?> page) {
        page.startPage();
        page.setList(infraSystemService.getSysApiList(page.getParams()));
        return page;
    }

    @ApiOperation("API添加")
    @RequiresPermissions(value = SYS_APILIST_SAVE)
    @PostMapping(value = "/apiList/save")
    public RespondedBody sysApiListSave(@RequestBody OtSysApiList dto) {
        infraSystemService.saveOrUpdateSysApiList(dto);
        return RespondedBody.successful();
    }

    @ApiOperation("API移除")
    @RequiresPermissions(value = SYS_APILIST_REMOVE)
    @DeleteMapping(value = "/apiList/remove/{id}")
    public RespondedBody sysApiListRemove(@PathVariable("id") String id) {
        infraSystemService.removeSysApiList(id);
        return RespondedBody.successful();
    }

    @ApiOperation("授权用户角色")
    @RequiresPermissions(value = SYS_USER_GRANT)
    @PostMapping(value = "/grant/user_roles")
    public RespondedBody batchGrantUserRoles(@RequestBody GrantDto dto) {
        infraSystemService.batchGrantUserRoles(dto.getGrantIds(), dto.getPermissions());
        return RespondedBody.successful();
    }

    @ApiOperation("授权角色菜单")
    @RequiresPermissions(value = SYS_ROLE_GRANT)
    @PostMapping(value = "/grant/role_menu")
    public RespondedBody batchGrantRoleMenus(@RequestBody GrantDto dto) {
        infraSystemService.batchGrantRoleMenus(dto.getGrantIds(), dto.getPermissions(), dto.getHalfPermissions());
        return RespondedBody.successful();
    }

    @ApiOperation("授权角色API权限")
    @PostMapping(value = "/grant/role_authorities")
    public RespondedBody batchGrantRolePermissions(@RequestBody GrantDto dto) {
        infraSystemService.batchGrantRolePermissions(dto.getGrantIds(), dto.getPermissions());
        return RespondedBody.successful();
    }

    @ApiOperation("授权菜单API权限")
    @PostMapping(value = "/grant/menu_authorities")
    public RespondedBody batchGrantMenuPermissions(@RequestBody GrantDto dto) {
        infraSystemService.batchGrantMenuPermissions(dto.getGrantIds(), dto.getPermissions());
        return RespondedBody.successful();
    }

    private final ClassScanner classScanner;
    private final OtSysAuthorityMapper sysAuthorityMapper;

    @ApiOperation("添加增量权限")
    @PostMapping(value = "/sync/authorities")
    public RespondedBody syncAuthorities() {
        Set<OtSysApiList> apiLists = classScanner.doScan("com.onlythinking.shop.mgt");
        Set<OtSysAuthority> authorities = classScanner.toSysAuthorities(apiLists);
        for (OtSysAuthority dto : authorities) {
            OtSysAuthority db = sysAuthorityMapper.getByPK(dto.getId());
            if (null != db) {
                BeanUtils.copyProperties(dto, db);
                sysAuthorityMapper.updateByPK(dto);
            } else {
                sysAuthorityMapper.insert(dto);
            }
        }
        return RespondedBody.successful();
    }


}
