package com.onlythinking.shop.mgt.core.security.filter;

import com.onlythinking.shop.mgt.core.utils.ResponseUtils;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public class RestPermissionsAuthorizationFilter extends FormAuthenticationFilter {

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        ResponseUtils.response401(response);
        return false;
    }

    @Bean
    public FilterRegistrationBean registration(RestPermissionsAuthorizationFilter filter) {
        FilterRegistrationBean registration = new FilterRegistrationBean(filter);
        registration.setEnabled(false);
        return registration;
    }
}
