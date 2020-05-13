package com.onlythinking.shop.app.core.security.service;

import lombok.Data;

import java.io.Serializable;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
public class JwtAuthenticationResponse implements Serializable {
    private final String token;
    private String redirect;

    public JwtAuthenticationResponse(String token) {
        this.token = token;
    }

    public JwtAuthenticationResponse(String token, String redirect) {
        this.token = token;
        this.redirect = redirect;
    }
}
