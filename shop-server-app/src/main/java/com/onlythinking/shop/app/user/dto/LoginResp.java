package com.onlythinking.shop.app.user.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@ApiModel("登录响应")
@Data
public class LoginResp {

    @ApiModelProperty(value = "Token", required = true)
    private String token;

    @ApiModelProperty(value = "已注册", required = true)
    private boolean hasUser;
}
