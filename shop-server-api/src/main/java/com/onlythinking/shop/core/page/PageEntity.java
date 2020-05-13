package com.onlythinking.shop.core.page;

import com.github.pagehelper.Page;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@ApiModel("分页对象")
@Data
public class PageEntity<T> implements Serializable {

    private static final String PAGE_NUM = "pageNum";
    private static final String PAGE_SIZE = "pageSize";
    private static final String ORDER_BY = "orderBy";

    //当前页
    @ApiModelProperty("当前页")
    private int pageNum;
    //每页的数量
    @ApiModelProperty("每页的数量")
    private int pageSize;

    @ApiModelProperty(value = "排序")
    private String orderBy;

    //当前页的数量
    @ApiModelProperty("当前页的数量")
    private int size;
    //总页数
    @ApiModelProperty("总页数")
    private int pages;
    // 总数量
    @ApiModelProperty("总数量")
    protected long total;
    //结果集
    @ApiModelProperty("结果集")
    protected List<T> list;

    @ApiModelProperty("查询条件")
    protected Map<String, Object> params = new HashMap<String, Object>();//查询条件

    public PageEntity() {
        this.params.put("disabled", false);
    }

    public PageEntity(List<T> list) {
        this.list = list;
        if (list instanceof Page) {
            this.total = ((Page) list).getTotal();
        } else {
            this.total = list.size();
        }

        if (list instanceof Page) {
            Page page = (Page) list;
            this.pageNum = page.getPageNum();
            this.pageSize = page.getPageSize();

            this.pages = page.getPages();
            this.size = page.size();
        } else {
            this.pageNum = 1;
            this.pageSize = list.size();

            this.pages = this.pageSize > 0 ? 1 : 0;
            this.size = list.size();
        }
    }

    public void startPage() {
        this.params.put(PAGE_NUM, this.pageNum);
        this.params.put(PAGE_SIZE, this.pageSize);
        this.params.put(ORDER_BY, this.orderBy);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public void setList(List list) {
        this.list = list;
        if (list instanceof Page) {
            Page page = (Page) list;
            this.setTotal(page.getTotal());
            this.pageNum = page.getPageNum();
            this.pageSize = page.getPageSize();
            this.pages = page.getPages();
            this.size = page.size();
        }
    }

    public static <T> PageEntity<T> of(List<T> list) {
        return new PageEntity<T>(list);
    }

}
