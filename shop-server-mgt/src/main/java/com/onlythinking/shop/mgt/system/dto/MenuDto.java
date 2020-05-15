package com.onlythinking.shop.mgt.system.dto;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.onlythinking.shop.core.constant.DicConstant;
import com.onlythinking.shop.model.OtSysMenu;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
@ApiModel("菜单")
public class MenuDto implements Serializable, Comparable<MenuDto> {

    @ApiModelProperty(value = "ID", required = true)
    private String id;
    @ApiModelProperty(value = "Label", required = true)
    private String label;

    @ApiModelProperty(value = "Icon", required = true)
    private String icon;
    private boolean disabled;
    @ApiModelProperty(value = "是否叶节点")
    private boolean leaf;

    @ApiModelProperty(value = "排序")
    private Integer byOrder;

    private List<MenuDto> children = Lists.newArrayList();

    public void setDisabled(String isUserAble) {
        this.disabled = !DicConstant.VAL_1000_00.equals(isUserAble);
    }

    public static MenuDto of(OtSysMenu menu) {
        if (null == menu) {
            return null;
        }
        MenuDto dto = new MenuDto();
        dto.setId(menu.getId());
        if (StringUtils.isNotBlank(menu.getMeta())) {
            Map meta = JSON.parseObject(menu.getMeta(), Map.class);
            dto.setIcon((String) meta.get("icon"));
            String title = (String) meta.get("title");
            dto.setLabel(title);
        }
        if (StringUtils.isBlank(dto.getLabel())) {
            dto.setLabel(menu.getComponent());
        }
        dto.setByOrder(null == menu.getByOrder() ? 0 : menu.getByOrder());
        return dto;
    }

    @Override
    public int compareTo(MenuDto o) {
        if (null == o.getByOrder() && null == this.getByOrder()) {
            return 0;
        }
        if (null == this.getByOrder()) {
            return -1;
        }
        return this.getByOrder().compareTo(o.getByOrder());
    }
}
