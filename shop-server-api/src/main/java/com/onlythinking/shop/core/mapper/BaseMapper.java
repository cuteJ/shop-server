package com.onlythinking.shop.core.mapper;

import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * <p> BaseMapper </p>
 *
 * @author Li Xingping
 */
public interface BaseMapper<T> {
    T getByPK(Serializable id);

    T getOne(Map<String, Object> params);

    List<T> getList(Map<String, Object> params);

    void insert(T object);

    void insertInBatch(List<T> list);

    void updateByPK(T object);

    void updateBySelective(Map<String, Object> params);

    void deleteByPK(Serializable id);

    void deleteInBatch(@Param("array") List<String> ids);

    Long count(Map<String, Object> params);

}
