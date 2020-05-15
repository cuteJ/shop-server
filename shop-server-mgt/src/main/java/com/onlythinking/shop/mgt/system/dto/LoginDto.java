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
@ApiModel("管理登录")
public class LoginDto {

    @ApiModelProperty(value = "用户名", required = true)
    @NotBlank
    private String username;
    @ApiModelProperty(value = "密码", required = true)
    @NotBlank
    private String password;
}
