package com.onlythinking.shop.mgt.system.dto;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;
import com.onlythinking.shop.model.OtSysMenu;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.NotBlank;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
public class RouterMenu implements Comparable<RouterMenu> {

    @JsonIgnore
    private String id;
    @JsonIgnore
    @ApiModelProperty(value = "排序")
    private Integer byOrder;
    @NotBlank
    private String path;
    @NotBlank
    private String name;
    private String redirect = "noredirect";
    private String component;
    @ApiModelProperty(value = "始终显示")
    private Boolean alwaysShow;
    private List<RouterMenu> children = new ArrayList<>();
    /*
    {
        title: 'merchantInfoManager',
        icon: 'table'
    }
    */
    private Map meta;

    public static RouterMenu of(OtSysMenu menu) {
        RouterMenu routerMenu = new RouterMenu();
        routerMenu.setId(menu.getId());
        routerMenu.setPath(menu.getPath());
        routerMenu.setName(menu.getComponent());
        routerMenu.setAlwaysShow(menu.getAlwaysShow());
        routerMenu.setRedirect(StringUtils.isNotBlank(menu.getRedirect()) ? menu.getRedirect() : "noredirect");
        routerMenu.setComponent(menu.getComponent());
        if (StringUtils.isNotBlank(menu.getMeta())) {
            Map meta = JSON.parseObject(menu.getMeta(), Map.class);
            routerMenu.setMeta(meta);
        }
        routerMenu.setByOrder(null == menu.getByOrder() ? 0 : menu.getByOrder());
        return routerMenu;
    }

    public static List<RouterMenu> toRouterMenu(List<OtSysMenu> sysMenus) {
        if (CollectionUtils.isEmpty(sysMenus)) {
            return new ArrayList<>();
        }
        List<OtSysMenu> roots = sysMenus.stream().filter(v -> StringUtils.isBlank(v.getParentId())).collect(Collectors.toList());
        List<RouterMenu> routerMenus = Lists.newArrayList();

        for (OtSysMenu root : roots) {
            RouterMenu routerMenu = of(root);
            recursiveFind(routerMenu, sysMenus);
            routerMenus.add(routerMenu);
        }
        recursiveSort(routerMenus);
        return routerMenus;
    }

    private static void recursiveSort(List<RouterMenu> children) {
        if (CollectionUtils.isEmpty(children)) {
            return;
        }
        Collections.sort(children);
        for (RouterMenu parent : children) {
            recursiveSort(parent.getChildren());
        }
    }

    private static void recursiveFind(RouterMenu parent, List<OtSysMenu> sysMenus) {
        List<OtSysMenu> children = sysMenus.stream().filter(v -> parent.getId().equals(v.getParentId())).collect(Collectors.toList());
        if (CollectionUtils.isEmpty(children)) {
            return;
        }
        for (OtSysMenu child : children) {
            RouterMenu routerChild = of(child);
            parent.getChildren().add(routerChild);
            recursiveFind(routerChild, sysMenus);
        }
    }

    @Override
    public int compareTo(RouterMenu o) {
        if (null == o.getByOrder() && null == this.getByOrder()) {
            return 0;
        }
        if (null == this.getByOrder()) {
            return -1;
        }
        return this.getByOrder().compareTo(o.getByOrder());
    }
}

