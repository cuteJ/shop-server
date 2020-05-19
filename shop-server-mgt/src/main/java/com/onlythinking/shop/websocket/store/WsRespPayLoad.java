package com.onlythinking.shop.websocket.store;

import com.alibaba.fastjson.JSON;
import lombok.Builder;
import lombok.Data;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
@Builder
public class WsRespPayLoad {
    protected String username;
    protected String type;
    protected int code;
    private Object data;

    public static WsRespPayLoad of(int code, Object data) {
        return WsRespPayLoad.builder()
          .code(code)
          .data(data)
          .build();
    }

    public static WsRespPayLoad ofError(String message) {
        return WsRespPayLoad.builder()
          .code(400)
          .data(message)
          .build();
    }

    public static WsRespPayLoad of(Object data) {
        return WsRespPayLoad.builder().data(data).build();
    }

    public static WsRespPayLoad ok() {
        return of("ok");
    }

    public String toJson() {
        return JSON.toJSONString(this);
    }
}
