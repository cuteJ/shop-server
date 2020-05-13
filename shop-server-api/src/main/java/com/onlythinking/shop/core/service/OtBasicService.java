package com.onlythinking.shop.core.service;

import com.google.common.collect.ImmutableMap;
import com.onlythinking.commons.exception.RespondedException;
import com.onlythinking.shop.core.exception.CoreErrorCode;
import com.onlythinking.shop.core.mapper.BaseMapper;
import org.apache.ibatis.exceptions.TooManyResultsException;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface OtBasicService<T, M extends BaseMapper<T>> {

    M getMapper();

    default T getOne(String colName, String colValue) {
        try {
            return getMapper().getOne(ImmutableMap.of(colName, colValue));
        } catch (TooManyResultsException e) {
            throw RespondedException.of(CoreErrorCode.EXPECT_ONLY_ONE, "{mgt.select.only.one}", colName, colValue);
        }
    }

    @Transactional(readOnly = true)
    default List<T> getList(Map<String, Object> params) {
        return getMapper().getList(params);
    }

    default T get(Serializable id) {
        T entity = getMapper().getByPK(id);
        if (null == entity) {
            throw RespondedException.of(CoreErrorCode.ENTITY_NULL, "{mgt.entity.null}");
        }
        return entity;
    }

    default T get(Serializable id, String ifNullMsg) {
        T entity = getMapper().getByPK(id);
        if (null == entity) {
            throw RespondedException.of(CoreErrorCode.ENTITY_NULL, ifNullMsg);
        }
        return entity;
    }

}
