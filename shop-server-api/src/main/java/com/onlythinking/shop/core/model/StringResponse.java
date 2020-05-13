package com.onlythinking.shop.core.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@ApiModel("字符对象")
@Data
public class StringResponse {
    private final String value;

    @JsonCreator
    public StringResponse(@JsonProperty("value") @NotBlank String value) {
        this.value = value;
    }

    public static StringResponse of(String value) {
        return new StringResponse(value);
    }
}
