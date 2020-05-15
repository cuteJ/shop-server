package com.onlythinking.shop.mgt.system.model;

import com.onlythinking.shop.mgt.system.dto.RouterMenu;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@AllArgsConstructor
@Data
public class SysUserInfo implements Serializable {
    private String username;
    private String userId;
    private String avatar;
    // 商户编号
    private Set<String> roles;
    private Set<String> permissionList;
    private List<RouterMenu> menuList;

}
