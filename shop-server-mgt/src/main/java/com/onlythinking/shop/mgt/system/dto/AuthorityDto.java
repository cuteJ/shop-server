package com.onlythinking.shop.mgt.system.dto;

import com.google.common.collect.Lists;
import com.onlythinking.shop.core.constant.DicConstant;
import com.onlythinking.shop.model.OtSysAuthority;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
@ApiModel("权限")
public class AuthorityDto implements Serializable, Comparable<AuthorityDto> {

    @ApiModelProperty(value = "ID", required = true)
    private String id;
    @ApiModelProperty(value = "Label", required = true)
    private String label;

    private boolean disabled;

    @ApiModelProperty(value = "排序")
    private String byOrder;

    private List<AuthorityDto> children = Lists.newArrayList();

    public void setDisabled(String isUserAble) {
        this.disabled = !DicConstant.VAL_1000_00.equals(isUserAble);
    }

    public static AuthorityDto of(OtSysAuthority authority) {
        if (null == authority) {
            return null;
        }

        AuthorityDto dto = new AuthorityDto();
        dto.setId(authority.getId());
        dto.setLabel(authority.getAuthorityName());
        return dto;
    }

    @Override
    public int compareTo(AuthorityDto o) {
        if (null == o.getByOrder() && null == this.getByOrder()) {
            return 0;
        }
        if (null == this.getByOrder()) {
            return -1;
        }
        return this.getByOrder().compareTo(o.getByOrder());
    }
}
