package com.onlythinking.shop.app.core.ma.service;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
public class SwanMaJscode2SessionResult {

    @JsonProperty("session_key")
    private String sessionKey;

    @JsonProperty("openid")
    private String openid;
}
