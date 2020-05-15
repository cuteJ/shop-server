package com.onlythinking.shop.app.ma.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@ApiModel("小程序手机信息")
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Data
public class PhoneInfoDto extends EncryptedBase {

    @ApiModelProperty(value = "openid", required = true)
    private String openid;

    @ApiModelProperty(value = "用户信息", required = true)
    private String rawData;
}
