package com.onlythinking.shop.core.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@RequiredArgsConstructor
@ApiModel("选择器")
@Data
public class SelectTree implements Serializable {

    @NonNull
    @ApiModelProperty(value = "Value", required = true)
    private String value;
    @NonNull
    @ApiModelProperty(value = "Label", required = true)
    private String label;

    @ApiModelProperty(value = "Disabled", required = true)
    private boolean disabled;

    @ApiModelProperty(value = "Children", required = true)
    private List<SelectTree> children;
}
