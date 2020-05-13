package com.onlythinking.shop.core.filter;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.io.Serializable;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
@ConfigurationProperties("app.cors")
public class AppCorsProperties implements Serializable {

    private String allowOrigin = "*";
    private String allowMethods;
    private String allowHeaders;
    private Boolean allowCredentials = false;
    private Long maxAge = 3600L;
    private boolean local = false;
}
