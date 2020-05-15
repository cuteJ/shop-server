package com.onlythinking.shop.mgt.system.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
@ApiModel("重置密码")
public class ResetPasswordDto {

    @NotBlank
    @ApiModelProperty(value = "当前密码", required = true)
    private String currentPassword;
    @NotBlank
    @ApiModelProperty(value = "原密码", required = true)
    private String originalPassword;
}
