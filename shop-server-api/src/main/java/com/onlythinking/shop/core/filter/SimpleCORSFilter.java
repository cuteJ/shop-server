package com.onlythinking.shop.core.filter;

import com.google.common.collect.Sets;
import com.onlythinking.shop.core.constant.AppSystem;
import org.apache.commons.lang3.StringUtils;
import org.springframework.core.Ordered;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public class SimpleCORSFilter implements Filter ,Ordered {

    private final AppCorsProperties properties;
    private Set<String> allowOrigins;

    public SimpleCORSFilter(AppCorsProperties properties) {
        this.properties = properties;
    }

    @Override
    public void init(FilterConfig fc) throws ServletException {
        allowOrigins = Sets.newHashSet(StringUtils.split(properties.getAllowOrigin(), AppSystem.SEPARATOR_COMMA));
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpServletRequest request = (HttpServletRequest) req;
        if ("*".equals(properties.getAllowOrigin())) {
            response.setHeader("Access-Control-Allow-Origin", properties.getAllowOrigin());
        } else {
            String origin = request.getHeader("origin");

            if (allowOrigins.contains(origin)) {
                response.setHeader("Access-Control-Allow-Origin", origin);
            }
        }

//        Access-Control-Expose-Headers "Content-Length, X-JSON"
        response.setHeader("Access-Control-Expose-Headers", "Content-Length, X-JSON");
        response.setHeader("Access-Control-Allow-Methods", properties.getAllowMethods());
        response.setHeader("Access-Control-Max-Age", String.valueOf(properties.getMaxAge()));
        response.setHeader("Access-Control-Allow-Headers", properties.getAllowHeaders());
        response.setHeader("Access-Control-Allow-Credentials", properties.getAllowCredentials().toString());

        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            chain.doFilter(req, resp);
        }
    }

    @Override
    public void destroy() {
    }

    @Override
    public int getOrder() {
        return Ordered.HIGHEST_PRECEDENCE;
    }
}
