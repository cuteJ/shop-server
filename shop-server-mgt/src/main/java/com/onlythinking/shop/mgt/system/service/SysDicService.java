package com.onlythinking.shop.mgt.system.service;


import com.onlythinking.shop.model.OtSysDic;
import com.onlythinking.shop.model.OtSysTypeDic;

import java.util.List;
import java.util.Map;

public interface SysDicService {
    /**
     * 通过typeCode获取码值，提供前端接口
     */
    Map<String, Object> getDictionaries(String typeCode);

    Map<String, Object> getDictionaries(List<String> typeCode);

    // 码类别
    List<OtSysTypeDic> getSysTypeDicList(Map<String, Object> params);

    void saveOrUpdateSysTypeDic(OtSysTypeDic entity);

    void removeSysTypeDic(String id);

    // 码类
    List<OtSysDic> getSysDicList(Map<String, Object> params);

    void saveOrUpdateSysDic(OtSysDic entity);

    void removeSysDic(String id);

    String getLastTypeDicCode();

    String getLastDicCode(String typeCode);
}

