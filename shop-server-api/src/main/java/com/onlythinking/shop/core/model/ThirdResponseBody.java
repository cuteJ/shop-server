package com.onlythinking.shop.core.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.onlythinking.commons.exception.GlobalErrorCode;
import com.onlythinking.commons.exception.RespondedException;
import com.onlythinking.shop.core.exception.CoreErrorCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@ApiModel("调用外部服务响应")
@Data
public class ThirdResponseBody {

    @ApiModelProperty(value = "返回码", example = "0", required = true, position = 0)
    @JsonProperty("code")
    private int code;

    @ApiModelProperty(value = "说明", example = "ok", position = 1)
    @JsonProperty("message")
    private String message;

    @ApiModelProperty(value = "数据", position = 2)
    @JsonProperty("data")
    private Object data;

    @JsonCreator
    public ThirdResponseBody(@JsonProperty("code") @NotNull int code,
                             @JsonProperty("message") String message,
                             @JsonProperty("data") Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public Object ifSuccessOfData() {
        if (GlobalErrorCode.SUCCESSFUL != this.code) {
            if (CoreErrorCode.THIRD_HTTP_CLIENT_ERROR == this.code) {
                throw new RespondedException(CoreErrorCode.THIRD_HTTP_CLIENT_ERROR, this.message);
            } else {
                throw new RespondedException(CoreErrorCode.THIRD_HTTP_CLIENT_ERROR, String.format("Third code [%s] message:[%s]", code, message));
            }
        }
        return this.data;
    }


    public static ThirdResponseBody of(int code, String message, Object data) {
        return new ThirdResponseBody(code, message, data);
    }

    public static ThirdResponseBody successful() {
        return new ThirdResponseBody(GlobalErrorCode.SUCCESSFUL, "ok", null);
    }

    public static ThirdResponseBody successful(Object data) {
        return new ThirdResponseBody(GlobalErrorCode.SUCCESSFUL, "ok", data);
    }

    public static ThirdResponseBody fail(int code, String message) {
        return new ThirdResponseBody(code, message, null);
    }

    public static ThirdResponseBody fail(String message) {
        return new ThirdResponseBody(CoreErrorCode.THIRD_HTTP_CLIENT_ERROR, message, null);
    }

    public static ThirdResponseBody fail(int code) {
        return new ThirdResponseBody(code, null, null);
    }

}
