package com.onlythinking.shop.mgt.system.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.model.OtSysUser;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.apache.commons.lang3.StringUtils;

import java.util.Arrays;
import java.util.List;

/**
 * ot_sys_user
 * <p>
 * 系统用户
 *
 * @author lixingping
 * Date 2019-02-22 21:42:02
 */
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Data
@ApiModel("系统用户信息")
public class OtSysUserView extends OtSysUser {

    /**
     * 角色名称
     */
    @ApiModelProperty(value = "角色名称")
    private List<String> roleNames;

    /**
     * 角色编码
     */
    @ApiModelProperty(value = "角色编码")
    private List<String> roleCodes;


    /**
     * 角色名称
     */
    @ApiModelProperty(value = "角色名称显示")
    private String roleNameViews;

    /**
     * 角色编码
     */
    @ApiModelProperty(value = "角色编码显示")
    private String roleCodeViews;


    @ApiModelProperty(value = "编辑密码")
    private String pwd;

    public void fillRoleList() {
        if (StringUtils.isNotBlank(roleNameViews)) {
            this.roleNames = Arrays.asList(StringUtils.split(this.roleNameViews, AppSystem.SEPARATOR_COMMA));
        }
        if (StringUtils.isNotBlank(roleCodeViews)) {
            this.roleCodes = Arrays.asList(StringUtils.split(this.roleCodeViews, AppSystem.SEPARATOR_COMMA));
        }
    }

    @JsonIgnore
    @Override
    public String getPassword() {
        return super.getPassword();
    }
}
