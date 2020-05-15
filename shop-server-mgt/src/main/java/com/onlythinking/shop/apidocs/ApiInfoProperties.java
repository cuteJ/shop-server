package com.onlythinking.shop.apidocs;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
@ConfigurationProperties(prefix = "apiDocs", ignoreInvalidFields = true)
public class ApiInfoProperties {
    private String author;
    private String url;
    private String email;
    private String title;
    private String description;
    private String version;
    private String basePackage;
}
