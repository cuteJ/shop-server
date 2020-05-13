package com.onlythinking.shop.core.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@ApiModel("单值响应对象")
@Data
public class PrimitiveResponse {
    private final Object value;

    @JsonCreator
    public PrimitiveResponse(@JsonProperty("value") @NotNull Object value) {
        this.value = value;
    }

    public static PrimitiveResponse of(Object value) {
        return new PrimitiveResponse(value);
    }
}
