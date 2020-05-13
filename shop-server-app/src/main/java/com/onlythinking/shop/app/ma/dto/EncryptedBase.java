package com.onlythinking.shop.app.ma.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
public class EncryptedBase {

    @ApiModelProperty(value = "签名", required = true)
    private String signature;

    @ApiModelProperty(value = "加密数据", required = true)
    private String encryptedData;

    @ApiModelProperty(value = "加密算法的初始向量", required = true)
    private String iv;
}
