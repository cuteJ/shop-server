package com.onlythinking.shop.core.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Value;

import java.io.Serializable;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@ApiModel("选择器")
@Value
public class SelectOptions implements Serializable {

    @ApiModelProperty(value = "Value", required = true)
    private String value;
    @ApiModelProperty(value = "Label", required = true)
    private String label;

    @ApiModelProperty(value = "disabled")
    private boolean disabled;

}
