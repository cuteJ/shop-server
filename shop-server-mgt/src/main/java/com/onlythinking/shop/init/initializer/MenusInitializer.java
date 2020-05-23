package com.onlythinking.shop.init.initializer;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import com.onlythinking.shop.mapper.OtSysMenuMapper;
import com.onlythinking.shop.model.OtSysMenu;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.onlythinking.shop.mgt.core.constant.PermissionsConstant.*;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor
public class MenusInitializer implements Initializer {

    private Initializer next;

    @Override
    public Initializer getNext() {
        return next;
    }

    @Override
    public Initializer buildNext(Initializer next) {
        this.next = next;
        return this.next;
    }

    private final OtSysMenuMapper sysMenuMapper;

    private List<SysMenuDto> menuMap = Lists.newArrayList(
      new SysMenuDto(SYSTEM_MANAGER, "系统管理", "/sys", "system", null, 2, true),
      new SysMenuDto(SYS_USER_MANAGER, "用户管理", "user_manager", "child", SYSTEM_MANAGER, 1, false),
      new SysMenuDto(SYS_ROLE_MANAGER, "角色管理", "role_manager", "child", SYSTEM_MANAGER, 2, false),
      new SysMenuDto(SYS_MENU_MANAGER, "菜单管理", "menu_manager", "child", SYSTEM_MANAGER, 3, false),
      new SysMenuDto(SYS_JOB_MANAGER, "定时任务", "job_manager", "child", SYSTEM_MANAGER, 4, false),
      new SysMenuDto(SYS_AUTHORITY_MANAGER, "接口权限", "authority_manager", "child", SYSTEM_MANAGER, 5, false),
      new SysMenuDto(SYS_API_LIST_MANAGER, "接口列表", "apiList_manager", "child", SYSTEM_MANAGER, 6, false),
      new SysMenuDto(SYS_DIC_MANAGER, "常量管理", "dic_manager", "child", SYSTEM_MANAGER, 7, false),
      new SysMenuDto(SYS_REGION_MANAGER, "地区管理", "region_manager", "child", SYSTEM_MANAGER, 8, false),
      new SysMenuDto(SYS_METADATA_MANAGER, "数据字典", "metadata_manager", "child", SYSTEM_MANAGER, 9, false),
      new SysMenuDto(SYS_OPTLOG_MANAGER, "操作日志", "optLog_manager", "child", SYSTEM_MANAGER, 10, false),

      new SysMenuDto(APP_MANAGER, "应用管理", "/app", "app", null, 1, true),
      new SysMenuDto(APP_BRAND_MANAGER, "应用品牌", "brand_manager", "child", APP_MANAGER, 1, false),

      new SysMenuDto(USER_MANAGER, "用户管理", "/user", "user", null, 0, true),
      new SysMenuDto(USER_LOGIN_MANAGER, "用户列表", "user_manager", "child", USER_MANAGER, 1, false),

      new SysMenuDto(STATISTICS_MANAGER, "统计管理", "/statistics", "pc_statistics", null, 0, true),
      new SysMenuDto(STATISTICS_CHART_MANAGER, "图表统计", "chart", "child", STATISTICS_MANAGER, 0, false)
    );

    @Override
    public void before() {
        log.info("开始初始化Menus....");
        List<OtSysMenu> dbMenus = Lists.newArrayList();
        for (SysMenuDto dto : menuMap) {
            dbMenus.addAll(sysMenuMapper.getList(ImmutableMap.of("component", dto.getComponent())));
        }
        if (CollectionUtils.isNotEmpty(dbMenus)) {
            sysMenuMapper.deleteInBatch(dbMenus.stream().map(OtSysMenu::getId).collect(Collectors.toList()));
        }
    }

    @Override
    public void process() {
        for (SysMenuDto dto : menuMap) {
            OtSysMenu d = new OtSysMenu();
            if (StringUtils.isNotBlank(dto.getParentId())) {
                d.setParentId(dto.getParentId());
            }
            d.setId(dto.getComponent());
            d.setByOrder(dto.getByOrder());
            d.setComponent(dto.getComponent());
            d.setPath(dto.getPath());
            d.setHidden(false);
            d.setParentId(dto.getParentId());
            d.setAlwaysShow(dto.getAlwaysShow());
            Map<String, Object> meta = new HashMap<>();
            meta.put("title", dto.getTitle());
            meta.put("icon", dto.getIcon());
            d.setMeta(JSON.toJSONString(meta));
            sysMenuMapper.insert(d);
        }

        log.info("初始化Menus结束");
    }


    @Data
    public static class SysMenuDto {
        private String component;
        private String title;
        private String path;
        private String icon;
        private String parentId;
        private int byOrder;
        private Boolean alwaysShow;

        public SysMenuDto(String component, String title, String path, String icon, String parentId, int byOrder, Boolean alwaysShow) {
            this.component = component;
            this.title = title;
            this.path = path;
            this.icon = icon;
            this.parentId = parentId;
            this.byOrder = byOrder;
            this.alwaysShow = alwaysShow;
        }
    }
}
