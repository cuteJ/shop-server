package com.onlythinking.shop.core.page;

/**
 * <p> 分页 </p>
 *
 * @author Li Xingping
 */
public interface Pageable {

    int getPageNum();

    int getPageSize();

    String getOrderBy();
}
