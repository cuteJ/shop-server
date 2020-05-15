package com.onlythinking.shop.app.brand.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@ApiModel("小程序配置")
@Data
public class AppMaConfigDto {
    /**
     * 小程序的appid
     */
    @NotBlank
    @ApiModelProperty(value = "小程序的appid", required = true)
    private String appId;

    /**
     * 小程序的appKey
     */
    @ApiModelProperty(value = "小程序的appKey")
    private String appKey;

    /**
     * 应用编号
     */
    @NotBlank
    @ApiModelProperty(value = "应用编号", required = true)
    private String appNo;
}
