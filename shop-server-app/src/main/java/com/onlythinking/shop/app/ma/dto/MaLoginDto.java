package com.onlythinking.shop.app.ma.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@ApiModel("小程序登录")
@Data
public class MaLoginDto {

    @ApiModelProperty(value = "code", required = true)
    private String code;

    @ApiModelProperty(value = "用户名|手机号")
    private String username;

    @ApiModelProperty(value = "密码|验证码")
    private String password;
}
