package com.onlythinking.shop.core.multipart;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.core.Ordered;
import org.springframework.web.multipart.support.MultipartFilter;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public class OrderedMultipartFilter extends MultipartFilter implements Ordered {

    public static final int DEFAULT_ORDER = FilterRegistrationBean.REQUEST_WRAPPER_FILTER_MAX_ORDER - 10001;

    private int order = DEFAULT_ORDER;

    @Override
    public int getOrder() {
        return this.order;
    }

    public void setOrder(int order) {
        this.order = order;
    }
}
