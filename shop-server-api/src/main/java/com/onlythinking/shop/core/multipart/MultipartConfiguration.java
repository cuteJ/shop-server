package com.onlythinking.shop.core.multipart;

import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.web.MultipartProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.DispatcherServlet;

import java.io.IOException;

/**
 * <p> 文件上传 </p>
 *
 * @author Li Xingping
 */
@Configuration
@ConditionalOnClass(FileItem.class)
@ConditionalOnProperty(prefix = "spring.http.multipart", name = "enabled", matchIfMissing = true)
public class MultipartConfiguration {

    private final MultipartProperties properties;

    @Autowired
    public MultipartConfiguration(MultipartProperties properties) {
        this.properties = properties;
    }

    @Bean
    public OrderedMultipartFilter multipartFilter() {
        OrderedMultipartFilter multipartFilter = new OrderedMultipartFilter();
        multipartFilter.setMultipartResolverBeanName(DispatcherServlet.MULTIPART_RESOLVER_BEAN_NAME);
        return multipartFilter;
    }

    @Bean(name = DispatcherServlet.MULTIPART_RESOLVER_BEAN_NAME)
    public CommonsMultipartResolver multipartResolver() throws IOException {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        if (StringUtils.hasText(this.properties.getMaxFileSize())) {
            multipartResolver.setMaxUploadSize(toFileBytes(this.properties.getMaxFileSize()));
        }
        if (StringUtils.hasText(this.properties.getLocation())) {
            multipartResolver.setUploadTempDir(new FileSystemResource(this.properties.getLocation()));
        }
        multipartResolver.setResolveLazily(this.properties.isResolveLazily());
        return multipartResolver;
    }

    private long toFileBytes(String fileSize) {
        if (fileSize.endsWith("MB")) {
            return Long.parseLong(fileSize.replace("MB", "")) * 1024 * 1024;
        } else if (fileSize.endsWith("KB")) {
            return Long.parseLong(fileSize.replace("KB", "")) * 1024;
        } else {
            throw new IllegalArgumentException("Illegal size");
        }
    }
}
