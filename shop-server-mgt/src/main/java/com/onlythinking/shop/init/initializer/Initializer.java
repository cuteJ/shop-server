package com.onlythinking.shop.init.initializer;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface Initializer {
    /**
     * 清除之前数据
     */
    void before();

    /**
     * 插入新数据
     */
    void process();

    Initializer getNext();

    Initializer buildNext(Initializer next);

}
