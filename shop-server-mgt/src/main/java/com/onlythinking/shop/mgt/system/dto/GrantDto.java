package com.onlythinking.shop.mgt.system.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
@ApiModel("授权请求")
public class GrantDto {

    @ApiModelProperty(value = "授权对象ID（用户ID|角色ID）", required = true)
    private List<String> grantIds;

    @ApiModelProperty(value = "授权权限", required = true)
    private List<String> permissions;

    @ApiModelProperty(value = "授权权限(半选)")
    private List<String> halfPermissions;
}
