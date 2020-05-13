package com.onlythinking.shop.app.ma.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Data
public class UserInfoDto extends EncryptedBase {

    @ApiModelProperty(value = "openid", required = true)
    private String openid;

    @ApiModelProperty(value = "用户信息", required = true)
    private String rawData;
}
